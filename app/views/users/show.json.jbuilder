json.user do
  json.id @user.id
  json.name @user.name
  json.last_name @user.last_name
  json.email @user.email
  json.vehicles @user.vehicles do |vehicle|
    json.id vehicle.id
    json.brand vehicle.brand
    json.vin vehicle.vin
  end

  if @user.errors.any?
    json.errors @user.errors.full_messages
  end
end
