require 'swagger_helper'

RSpec.describe 'api/v1/users/:user_id/tasks', type: :request do
  path '/api/v1/users/{user_id}/tasks' do
    post('create task') do
      tags 'Tasks'
      consumes 'application/json'
      security [Bearer: {}]
      parameter name: :user_id, in: :path, type: :string
      parameter name: :Authorization, in: :header, type: :string, required: true
      parameter name: :task, in: :body, schema: {
        type: :object,
        properties: {
          title: { type: :string, example: 'Task title' },
          description: { type: :string, example: 'Task description' },
          due_date: { type: :string, example: '2021-06-19 18:30:00' },
          completed: { type: :boolean, example: false }
        },
        required: %w[title description due_date status]
      }

      response(201, 'successful') do
        let(:user) { create(:user) }
        let(:Authorization) { "Bearer #{user.generate_jwt}" }
        let(:user_id) { user.id }
        let(:task) { FactoryBot.attributes_for(:task) }
        run_test!
      end

      response(422, 'unprocessable_entity') do
        let(:user) { create(:user) }
        let(:Authorization) { "Bearer #{user.generate_jwt}" }
        let(:user_id) { user.id }
        let(:task) { FactoryBot.attributes_for(:task, title: nil) }
        run_test!
      end
    end
  end

  path '/api/v1/users/{user_id}/tasks' do
    get('list tasks') do
      tags 'Tasks'
      consumes 'application/json'
      security [Bearer: {}]
      parameter name: :user_id, in: :path, type: :string
      parameter name: :Authorization, in: :header, type: :string, required: true

      response(200, 'successful') do
        let(:user) { create(:user) }
        let(:Authorization) { "Bearer #{user.generate_jwt}" }
        let(:user_id) { user.id }
        run_test!
      end

      response(404, 'not_found') do
        let(:user) { create(:user) }
        let(:Authorization) { "Bearer #{user.generate_jwt}" }
        let(:user_id) { 'invalid' }
        run_test!
      end
    end
  end

  path '/api/v1/users/{user_id}/tasks/{id}' do
    before(:each) do
      @user = create(:user)
      @task = create(:task, user: @user)
    end

    get('show task') do
      tags 'Tasks'
      consumes 'application/json'
      security [Bearer: {}]
      parameter name: :user_id, in: :path, type: :string
      parameter name: :id, in: :path, type: :string
      parameter name: :Authorization, in: :header, type: :string, required: true

      response(200, 'successful') do
        let(:Authorization) { "Bearer #{@user.generate_jwt}" }
        let(:user_id) { @user.id }
        let(:id) { @task.id }
        run_test!
      end

      response(404, 'not_found') do
        let(:Authorization) { "Bearer #{@user.generate_jwt}" }
        let(:user_id) { @user.id }
        let(:id) { 'invalid' }
        run_test!
      end
    end
  end

  path '/api/v1/users/{user_id}/tasks/{id}' do
    before(:each) do
      @user = create(:user)
      @task = create(:task, user: @user)
    end

    patch('update task') do
      tags 'Tasks'
      consumes 'application/json'
      security [Bearer: {}]
      parameter name: :user_id, in: :path, type: :string
      parameter name: :id, in: :path, type: :string
      parameter name: :Authorization, in: :header, type: :string, required: true
      parameter name: :task, in: :body, schema: {
        type: :object,
        properties: {
          title: { type: :string, example: 'Task title' },
          description: { type: :string, example: 'Task description' },
          due_date: { type: :string, example: '2021-06-19 18:30:00' },
          completed: { type: :boolean, example: false }
        },
        required: %w[title description due_date status]
      }

      response(200, 'successful') do
        let(:Authorization) { "Bearer #{@user.generate_jwt}" }
        let(:user_id) { @user.id }
        let(:id) { @task.id }
        let(:task) { { completed: false } }
        run_test!
      end

      response(404, 'not_found') do
        let(:Authorization) { "Bearer #{@user.generate_jwt}" }
        let(:user_id) { @user.id }
        let(:id) { 'invalid' }
        let(:task) { { completed: false } }
        run_test!
      end
    end

    delete('delete task') do
      tags 'Tasks'
      consumes 'application/json'
      security [Bearer: {}]
      parameter name: :user_id, in: :path, type: :string
      parameter name: :id, in: :path, type: :string
      parameter name: :Authorization, in: :header, type: :string, required: true

      response(200, 'successful') do
        let(:Authorization) { "Bearer #{@user.generate_jwt}" }
        let(:user_id) { @user.id }
        let(:id) { @task.id }
        run_test!
      end

      response(404, 'not_found') do
        let(:Authorization) { "Bearer #{@user.generate_jwt}" }
        let(:user_id) { @user.id }
        let(:id) { 'invalid' }
        run_test!
      end
    end
  end
end
