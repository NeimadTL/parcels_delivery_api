require 'test_helper'

class TransporterCompaniesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @transporter_company = transporter_companies(:one)
  end

  test "should get index" do
    get transporter_companies_url, as: :json
    assert_response :success
  end

  test "should create transporter_company" do
    assert_difference('TransporterCompany.count') do
      post transporter_companies_url, params: { transporter_company: { name: @transporter_company.name, siret: @transporter_company.siret } }, as: :json
    end

    assert_response 201
  end

  test "should show transporter_company" do
    get transporter_company_url(@transporter_company), as: :json
    assert_response :success
  end

  test "should update transporter_company" do
    patch transporter_company_url(@transporter_company), params: { transporter_company: { name: @transporter_company.name, siret: @transporter_company.siret } }, as: :json
    assert_response 200
  end

  test "should destroy transporter_company" do
    assert_difference('TransporterCompany.count', -1) do
      delete transporter_company_url(@transporter_company), as: :json
    end

    assert_response 204
  end
end
