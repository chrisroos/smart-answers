module SmartAnswer::Calculators
  class LandlordImmigrationCheckCalculator
    include ActiveModel::Model

    attr_accessor :postcode

    def rules_apply?
      countries_for_postcode.include?('England')
    end

    def countries_for_postcode
      areas_for_postcode.map(&:country_name).uniq
    end

    def areas_for_postcode
      Services.imminence_api.areas_for_postcode(postcode).results
    end
  end
end
