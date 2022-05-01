# frozen_string_literal: true

require 'application_system_test_case'

class ProductionCompaniesTest < ApplicationSystemTestCase
  setup do
    @production_company = production_companies(:one)
  end

  test 'visiting the index' do
    visit production_companies_url
    assert_selector 'h1', text: 'Production companies'
  end

  test 'should create production company' do
    visit production_companies_url
    click_on 'New production company'

    fill_in 'Name', with: @production_company.name
    click_on 'Create Production company'

    assert_text 'Production company was successfully created'
    click_on 'Back'
  end

  test 'should update Production company' do
    visit production_company_url(@production_company)
    click_on 'Edit this production company', match: :first

    fill_in 'Name', with: @production_company.name
    click_on 'Update Production company'

    assert_text 'Production company was successfully updated'
    click_on 'Back'
  end

  test 'should destroy Production company' do
    visit production_company_url(@production_company)
    click_on 'Destroy this production company', match: :first

    assert_text 'Production company was successfully destroyed'
  end
end
