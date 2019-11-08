RSpec.describe OMCMS do
  let!(:client) {
    OMCMS::Client.new(
      host: ENV["OMCMS_HOST"]
      public_key: ENV["OMCMS_PUBLIC_KEY"],
      private_key: ENV["OMCMS_PRIVATE_KEY"]
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
    offering = client.offerings.get(1)
    expect(offering).not_to be nil
  end

  it "can fetch all components for specific offering" do
    offering = client.offerings.get(1)
    components = offering.components.all
    expect(components).not_to be nil
  end

  it "can fetch specific component for specific offering" do
    offering = client.offerings.get(1)
    component = offering.components.get(1)
    expect(component).not_to be nil
  end

  it "can fetch all offering_data for specific offering" do
    offering = client.offerings.get(1)
    offering_data = offering.data.all
    expect(offering_data).not_to be nil
  end

  it "can fetch specific offering_data for specific offering" do
    offering = client.offerings.get(1)
    offering_data = offering.data.get(1)
    expect(offering_data).not_to be nil
  end
end
