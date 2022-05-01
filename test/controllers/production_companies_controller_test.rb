# frozen_string_literal: true

require 'test_helper'

class ProductionCompaniesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @production_company = production_companies(:one)
  end

  test 'should get index' do
    get production_companies_url
    assert_response :success
  end

  test 'should get new' do
    get new_production_company_url
    assert_response :success
  end

  test 'should create production_company' do
    assert_difference('ProductionCompany.count') do
      post production_companies_url, params: { production_company: { name: @production_company.name } }
    end

    assert_redirected_to production_company_url(ProductionCompany.last)
  end

  test 'should show production_company' do
    get production_company_url(@production_company)
    assert_response :success
  end

  test 'should get edit' do
    get edit_production_company_url(@production_company)
    assert_response :success
  end

  test 'should update production_company' do
    patch production_company_url(@production_company),
          params: { production_company: { name: @production_company.name } }
    assert_redirected_to production_company_url(@production_company)
  end

  test 'should destroy production_company' do
    assert_difference('ProductionCompany.count', -1) do
      delete production_company_url(@production_company)
    end

    assert_redirected_to production_companies_url
  end
end
