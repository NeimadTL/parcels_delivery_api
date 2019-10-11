# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)


TransporterCompany.delete_all
PostCode.delete_all
TransportersPostcodesRelationship.delete_all


paris = PostCode.create!(code: '75000')
lille = PostCode.create!(code: '59000')
montpellier = PostCode.create!(code: '34000')

dhl_transporter = TransporterCompany.create!(name: 'DHL', siret: '12345678912345')
ups_transporter = TransporterCompany.create!(name: 'UPS', siret: '12345678954321')
fedex_transporter = TransporterCompany.create!(name: 'FEDEX', siret: '98765432154321')

TransportersPostcodesRelationship.create!(
  transporter_company_id: dhl_transporter.id,
  post_code_id: paris.id)
TransportersPostcodesRelationship.create!(
  transporter_company_id: dhl_transporter.id,
  post_code_id: lille.id)
TransportersPostcodesRelationship.create!(
  transporter_company_id: dhl_transporter.id,
  post_code_id: montpellier.id)


TransportersPostcodesRelationship.create!(
  transporter_company_id: ups_transporter.id,
  post_code_id: paris.id)
TransportersPostcodesRelationship.create!(
  transporter_company_id: ups_transporter.id,
  post_code_id: montpellier.id)

TransportersPostcodesRelationship.create!(
  transporter_company_id: fedex_transporter.id,
  post_code_id: montpellier.id)
