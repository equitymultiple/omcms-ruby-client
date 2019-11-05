RSpec.describe OMCMS do
  let!(:client) {
    OMCMS::Client.new(
      host: "http://localhost:8877",
      public_key: "4dac249f03d2463cac37796e9f97fdc6",
      private_key: "4dd74b2c2e644163bc16291b395ce381"
    )
  }

  it "has a version number" do
    expect(OMCMS::VERSION).not_to be nil
  end

  it "can fetch all offerings" do
    offerings = client.offerings.all
    expect(offerings).not_to be nil
  end

  it "can fetch specific offering" do
    offering = client.offerings.find(69)
    expect(offering).not_to be nil
  end

  it "can fetch all components for specific offering" do
    offering = client.offerings.find(69)
    components = offering.components.all
    expect(components).not_to be nil
  end

  it "can fetch specific component for specific offering" do
    offering = client.offerings.find(69)
    component = offering.components.find(490)
    expect(component).not_to be nil
  end

  it "can fetch all offering_data for specific offering" do
    offering = client.offerings.find(61)
    offering_data = offering.data.all
    expect(offering_data).not_to be nil
  end

  it "can fetch specific offering_data for specific offering" do
    offering = client.offerings.find(61)
    offering_data = offering.data.find(33)
    expect(offering_data).not_to be nil
  end
end
