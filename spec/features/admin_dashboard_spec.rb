require 'rails_helper'

describe 'admin_dashboard access' do 

	it 'es puede acceder exitosamente' do
		visit admin_root_path
		expect(page.status_code).to eq(200)
	end

	it 'no permite a cualquier usuario accedes sin logearse' do
		visit admin_root_path
		expect(current_path).to eq(new_user_session_path)
	end
end