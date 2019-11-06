RSpec.describe OMCMS do
  let!(:client) {
    OMCMS::Client.new(
      host: "http://localhost:8877",
      public_key: "a2c06b01b9a8483a977a497eb356d1ac",
      private_key: "15c840e091284f27b6e3578a7f54103d"
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
    offering = client.offerings.get(69)
    expect(offering).not_to be nil
  end

  it "can fetch all components for specific offering" do
    offering = client.offerings.get(69)
    components = offering.components.all
    expect(components).not_to be nil
  end

  it "can fetch specific component for specific offering" do
    offering = client.offerings.get(69)
    component = offering.components.get(490)
    expect(component).not_to be nil
  end

  it "can fetch all offering_data for specific offering" do
    offering = client.offerings.get(61)
    offering_data = offering.data.all
    expect(offering_data).not_to be nil
  end

  it "can fetch specific offering_data for specific offering" do
    offering = client.offerings.get(61)
    offering_data = offering.data.get(33)
    expect(offering_data).not_to be nil
  end
end
