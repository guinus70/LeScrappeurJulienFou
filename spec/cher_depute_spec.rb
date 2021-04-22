require_relative '../lib/cher_depute'

describe "cher_depute" do
deputes_url = get_deputes_urls()

 describe "get_deputes_data" do
    it "should no return nil" do
      expect(get_deputes_data(deputes_url)).not_to be_nil
    end
    it "should equal 573" do
      expect(get_deputes_data(deputes_url).length).to eq(573)
    end
 
  end

end
