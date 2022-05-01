# frozen_string_literal: true

require 'application_system_test_case'

class MovieProductionCompaniesTest < ApplicationSystemTestCase
  setup do
    @movie_production_company = movie_production_companies(:one)
  end

  test 'visiting the index' do
    visit movie_production_companies_url
    assert_selector 'h1', text: 'Movie production companies'
  end

  test 'should create movie production company' do
    visit movie_production_companies_url
    click_on 'New movie production company'

    fill_in 'Movie', with: @movie_production_company.movie_id
    fill_in 'Production company', with: @movie_production_company.production_company_id
    click_on 'Create Movie production company'

    assert_text 'Movie production company was successfully created'
    click_on 'Back'
  end

  test 'should update Movie production company' do
    visit movie_production_company_url(@movie_production_company)
    click_on 'Edit this movie production company', match: :first

    fill_in 'Movie', with: @movie_production_company.movie_id
    fill_in 'Production company', with: @movie_production_company.production_company_id
    click_on 'Update Movie production company'

    assert_text 'Movie production company was successfully updated'
    click_on 'Back'
  end

  test 'should destroy Movie production company' do
    visit movie_production_company_url(@movie_production_company)
    click_on 'Destroy this movie production company', match: :first

    assert_text 'Movie production company was successfully destroyed'
  end
end
