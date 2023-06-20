require 'swagger_helper'

RSpec.describe 'api/v1/users', type: :request do
  path '/api/v1/users' do
    post('create user') do
      tags 'Users'
      consumes 'application/json'
      parameter name: :user, in: :body, schema: {
        type: :object,
        properties: {
          name: { type: :string, example: 'John Doe' },
          email: { type: :string, example: 'johndoe@example.com' },
          password: { type: :string, example: 'password' },
          password_confirmation: { type: :string, example: 'password' }
        },
        required: %w[name email password password_confirmation]
      }

      response(201, 'successful') do
        let(:user) { FactoryBot.attributes_for(:user) }
        run_test!
      end

      response(422, 'unprocessable_entity') do
        let(:user) { FactoryBot.attributes_for(:user, email: nil) }
        run_test!
      end
    end
  end

  path '/api/v1/users/{id}' do
    get('show user') do
      tags 'Users'
      consumes 'application/json'
      parameter name: :id, in: :path, type: :string

      response(200, 'successful') do
        let(:user) { create(:user) }
        let(:id) { user.id }
        run_test!
      end

      response(404, 'not_found') do
        let(:id) { 'invalid' }
        run_test!
      end
    end
  end

  path '/api/v1/users/{id}' do
    put('update user') do
      tags 'Users'
      consumes 'application/json'
      security [Bearer: {}]
      parameter name: :id, in: :path, type: :string
      parameter name: :Authorization, in: :header, type: :string, required: true
      parameter name: :user, in: :body, schema: {
        type: :object,
        properties: {
          name: { type: :string, example: 'John Doe' },
          email: { type: :string, example: 'janedoe@example.com' }
        },
        required: %w[name email]
      }

      response(200, 'successful') do
        let(:user) { create(:user) }
        let(:id) { user.id }
        let(:Authorization) { "Bearer #{user.generate_jwt}" }
        let(:registration) { { name: 'Jane Doe', email: 'janedoe@example.com' } }
        run_test!
      end

      response(401, 'unauthorized') do
        let(:user) { create(:user) }
        let(:id) { user.id }
        let(:Authorization) { 'Bearer invalid' }
        let(:registration) { { name: 'Jane Doe', email: 'janedoe@example.com' } }
        run_test!
      end
    end
  end

  path '/api/v1/users/{id}' do
    delete('delete user') do
      tags 'Users'
      consumes 'application/json'
      security [Bearer: {}]
      parameter name: :id, in: :path, type: :string
      parameter name: :Authorization, in: :header, type: :string, required: true

      response(200, 'successful') do
        let(:user) { create(:user) }
        let(:id) { user.id }
        let(:Authorization) { "Bearer #{user.generate_jwt}" }
        run_test!
      end

      response(401, 'unauthorized') do
        let(:user) { create(:user) }
        let(:id) { user.id }
        let(:Authorization) { 'Bearer invalid' }
        run_test!
      end
    end
  end

  path '/api/v1/users/sign_in' do
    post('sign in user') do
      tags 'Users'
      consumes 'application/json'
      parameter name: :session, in: :body, schema: {
        type: :object,
        properties: {
          email: { type: :string, example: 'johndoe@example.com' },
          password: { type: :string, example: 'password' }
        },
        required: %w[email password]
      }

      response(200, 'successful') do
        let(:user) { create(:user) }
        let(:session) { { email: user.email, password: user.password } }
        run_test!
      end

      response(422, 'unprocessable_entity') do
        let(:session) { { email: 'invalid', password: 'invalid' } }
        run_test!
      end
    end
  end

  path '/api/v1/users' do
    get('list users') do
      tags 'Users'
      consumes 'application/json'

      response(200, 'successful') do
        let(:user) { create(:user) }
        run_test!
      end
    end
  end
end
