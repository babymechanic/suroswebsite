# encoding: utf-8
require "spec_helper"

describe Refinery do
  describe "Presses" do
    describe "Admin" do
      describe "presses" do
        login_refinery_user

        describe "presses list" do
          before do
            FactoryGirl.create(:press, :name => "UniqueTitleOne")
            FactoryGirl.create(:press, :name => "UniqueTitleTwo")
          end

          it "shows two items" do
            visit refinery.presses_admin_presses_path
            page.should have_content("UniqueTitleOne")
            page.should have_content("UniqueTitleTwo")
          end
        end

        describe "create" do
          before do
            visit refinery.presses_admin_presses_path

            click_link "Add New Press"
          end

          context "valid data" do
            it "should succeed" do
              fill_in "Name", :with => "This is a test of the first string field"
              click_button "Save"

              page.should have_content("'This is a test of the first string field' was successfully added.")
              Refinery::Presses::Press.count.should == 1
            end
          end

          context "invalid data" do
            it "should fail" do
              click_button "Save"

              page.should have_content("Name can't be blank")
              Refinery::Presses::Press.count.should == 0
            end
          end

          context "duplicate" do
            before { FactoryGirl.create(:press, :name => "UniqueTitle") }

            it "should fail" do
              visit refinery.presses_admin_presses_path

              click_link "Add New Press"

              fill_in "Name", :with => "UniqueTitle"
              click_button "Save"

              page.should have_content("There were problems")
              Refinery::Presses::Press.count.should == 1
            end
          end

        end

        describe "edit" do
          before { FactoryGirl.create(:press, :name => "A name") }

          it "should succeed" do
            visit refinery.presses_admin_presses_path

            within ".actions" do
              click_link "Edit this press"
            end

            fill_in "Name", :with => "A different name"
            click_button "Save"

            page.should have_content("'A different name' was successfully updated.")
            page.should have_no_content("A name")
          end
        end

        describe "destroy" do
          before { FactoryGirl.create(:press, :name => "UniqueTitleOne") }

          it "should succeed" do
            visit refinery.presses_admin_presses_path

            click_link "Remove this press forever"

            page.should have_content("'UniqueTitleOne' was successfully removed.")
            Refinery::Presses::Press.count.should == 0
          end
        end

      end
    end
  end
end
