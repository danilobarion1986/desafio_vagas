require_relative './spec_helper.rb'
 
describe Talk do
	
	before :all do
		@title 			= "Title of talk lightning"
		@long_title = "Long title 45min"
		@talk 			= Talk.new @title
		@long_talk 	= Talk.new @long_title 
	end

	describe "#new" do
		it "return a new Talk object" do
			#@talk.should be_an_instance_of Talk # => Deprecated format
			expect(@talk).to be_an_instance_of Talk
		end

		it "takes no parameteres and not returns a Talk object" do
			#lambda { Talk.new }.should raise_exception ArgumentError # => Deprecated format
			expect { Talk.new }.to raise_error(ArgumentError)
		end

		it "takes more than one parameter and not returns a Talk object" do
			expect { Talk.new "Title", "More Title" }.to raise_error(ArgumentError)
		end
	end

	describe "#title" do
		it "returns the correct title" do
			#@talk.title.should == @title # => Deprecated format
			expect(@talk.title).to eql(@title) # => eql: same value and type
		end
	end	

	describe "#duration" do
		it "returns the corret duration for flash talks" do
			expect(@talk.duration).to eql(5)
		end

		it "returns the corret duration for long talks" do
			expect(@long_talk.duration).to eql(45)
		end
	end
end