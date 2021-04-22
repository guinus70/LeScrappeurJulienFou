require_relative '../lib/Mairie_christmas'

describe "mairie-christmas" do
townhall_urls = get_townhall_urls

 describe "get_townhalls_emails" do
    it "should no return nil" do
      expect(get_townhall_email(townhall_urls)).not_to be_nil
    end
    it "should equal 185" do
      expect(get_townhall_email(townhall_urls).length).to eq(185)
    end
    it "should have some cities" do
      cities_to_test = ["TAVERNY - 95150", "SERAINCOURT - 95450", "VAUDHERLAND - 95500", "MONTLIGNON - 95680"]
      cities_to_test.each do |x|
        cities_h = get_townhall_email(townhall_urls).find{|item| item.key?(x)} 
        expect(cities_h).not_to be_nil
        expect(cities_h[x]).to be_a(String)
      end
    end
    it "should not contain the city of CLAMART" do
     expect(get_townhall_email(townhall_urls).find{|item| item.key?("CLAMART")}).to eq(nil)
    end
  end

end


