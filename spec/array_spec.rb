require "spec_helper"
# require File.expand_path(File.dirname(__FILE__) + '/spec_helper')

# describe 'Array#each_recur' do
#   before(:each) do
#     @name_array = ["don", "na", "lai", "fu"]
#     @name_array_1 = [["don", "na"], ["lai"], "fu"]
#   end

#   # after(:all) do
#   #   User.destroy_all
#   # end

#   it "is array#each_recur exist?" do
#     expect(@name_array.respond_to?(:each_recur)).to eq false
#   end

#   it "when give a block" do
#     expect(@name_array.each_recur {|elem| elem.upcase}).to eql ["DON", "NA", "LAI", "FU"]
#     expect(@name_array_1.each_recur {|elem| elem.upcase}).to eql ["DON", "NA", "LAI", "FU"]
#   end

#   it "when not give a block" do
#     expect(@name_array.each_recur).to eql ["DON", "NA", "LAI", "FU"]
#     expect(@name_array_1.each_recur).to eql ["DON", "NA", "LAI", "FU"]
#   end
# end