require 'rails_helper'

describe TasksController do
  let(:user) {create(:user)}

  describe 'GET #edit' do

    context 'ログインしている場合' do
      before do
        login user
      end

      it "@taskに正しい値が入っていること" do
        task = create(:task)
        get :edit, params: {id: task}
        expect(assigns(:task)).to eq task
      end

      it "edit.html.hamlに遷移すること" do
        task = create(:task)
        get :edit, params: {id: task}
        expect(response).to render_template :edit
      end
    end
  end

  describe 'GET #index' do

    context 'ログインしている場合' do
      before do
        login user
      end

      it "@tasksに正しい値が入っていること" do
        tasks = create_list(:task, 3)
        get :index
        expect(assigns(:tasks)).to match(tasks)
      end

      it "index.html.hamlに遷移すること" do
        get :index
        expect(response).to render_template :index
      end
    end

    context 'ログインしていない場合' do

      it 'ログイン画面にリダイレクトすること' do
        get :index
        expect(response).to redirect_to "/users/sign_in"
      end
    end
  end

  describe 'POST #create' do
  
    context 'ログインしている場合' do
      before do
        login user
      end

      it "データベースにタスクの保存ができていること" do
        task_params = attributes_for(:task)
        expect{post :create, params: {task: task_params}}.to change(Task, :count).by(1)
      end

      it "index.html.hamlに遷移すること" do
        task_params = attributes_for(:task)
        post :create, params: {task: task_params}
        expect(response).to redirect_to (root_path)
      end
    end
  end

  describe 'PACH #update' do
  
    context 'ログインしている場合' do
      before do
        login user
      end

      it "正常にタスクを更新できること" do
        task_params = attributes_for(:task)
        expect{patch :update, params: {task: task_params}}
      end
    end
  end
end