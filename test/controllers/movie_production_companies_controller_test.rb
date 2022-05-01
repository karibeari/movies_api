# frozen_string_literal: true

require 'test_helper'

class MovieProductionCompaniesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @movie_production_company = movie_production_companies(:one)
  end

  test 'should get index' do
    get movie_production_companies_url
    assert_response :success
  end

  test 'should get new' do
    get new_movie_production_company_url
    assert_response :success
  end

  test 'should create movie_production_company' do
    assert_difference('MovieProductionCompany.count') do
      post movie_production_companies_url,
           params: { movie_production_company: { movie_id: @movie_production_company.movie_id,
                                                 production_company_id: @movie_production_company.production_company_id } }
    end

    assert_redirected_to movie_production_company_url(MovieProductionCompany.last)
  end

  test 'should show movie_production_company' do
    get movie_production_company_url(@movie_production_company)
    assert_response :success
  end

  test 'should get edit' do
    get edit_movie_production_company_url(@movie_production_company)
    assert_response :success
  end

  test 'should update movie_production_company' do
    patch movie_production_company_url(@movie_production_company),
          params: { movie_production_company: { movie_id: @movie_production_company.movie_id,
                                                production_company_id: @movie_production_company.production_company_id } }
    assert_redirected_to movie_production_company_url(@movie_production_company)
  end

  test 'should destroy movie_production_company' do
    assert_difference('MovieProductionCompany.count', -1) do
      delete movie_production_company_url(@movie_production_company)
    end

    assert_redirected_to movie_production_companies_url
  end
end
