# frozen_string_literal: true

require "rails_helper"

describe "トップ画面(top_path)のテスト" do
    before do
      visit top_path
    end
    context "表示の確認" do
       it "トップ画面(root_path)に「お出かけスポット検索」が表示されているか" do
         expect(page).to have_content "wellcome to I♡PET!! Pet outing review site"
       end
       it 'root_pathが"/"であるか' do
         expect(current_path).to eq("/")
       end
     end
  end
