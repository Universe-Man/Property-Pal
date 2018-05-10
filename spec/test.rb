require_relative '../app/models/admin.rb'

describe 'Admin test' do
  test_user = Admin.create(first_name: "Peter", last_name: "McPeter", email: "Peteyboy@gmail.com", password: "Peter4life", hint_password: "yourself")
    test_user2 = Admin.create(first_name: "Pet", last_name: "McPetdog", email: "Peteyboy@gmail.com", password: "Pet4life", hint_password: "yourself")
  test_property = Property.create(name: "Dungeon", admin_id: "19")
  test_sector = Sector.create(name: "Sexysector", property_id: "4" )
  test_tenant = Tenant.create(first_name: "Josh", last_name: "McJosh", email: "Joshyboy@gmail.com", password: "Josh4life", hint_password: "yourself", contract_id: "7", unit_id: "8")
  test_unit = Unit.create(name: "Myplace", sector_id: 2)

  it 'checks to see that test_user has been created' do
    expect(test_user).to be_true
  it 'check to see that test_property has been created' do
    expect(test_property).to be_true
  it "checks to see the test_sector has been created" do
    expect(test_sector).to be_true
  it "checks to see that test_tenant has been created" do
    expect(test_tenant).to be_true
  it "checks to see that test_unit has been created" do
    expect(test_unit).to be_true
  it "checks to see the #fullname correctly joins first_name and last_name" do
    expect(test_user.fullname).to be("Peter McPeter")
  it "checks to make sure email uniqueness validation is working" do
    expect(test_user2).to be(false)
              end
            end
          end
        end
      end
    end
  end
end
