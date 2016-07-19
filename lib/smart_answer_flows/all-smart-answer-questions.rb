module SmartAnswer
  class AllSmartAnswerQuestionsFlow < Flow
    def define
      name 'all-smart-answer-questions'
      status :draft

      additional_countries = [OpenStruct.new(slug: "mordor", name: "Mordor")]

      # todo for all: error messages/validation

      checkbox_question :checkbox_question? do
        option :radagast
        option :mithrandir
        option :olorin
        option :tharkun
        option :elrohir

        next_node do
          question :country_select?
        end
      end

      country_select :country_select?, additional_countries: additional_countries do
        next_node do
          question :date_question?
        end
      end

      # todo: multiple date types
      date_question :date_question? do
        next_node do
          question :money_question?
        end
      end

      money_question :money_question? do
        next_node do
          question :multiple_choice?
        end
      end

      multiple_choice :multiple_choice? do
        option :yes
        option :no
        option :maybe

        next_node do
          question :postcode_question?
        end
      end

      postcode_question :postcode_question? do
        next_node do
          question :salary_question?
        end
      end

      salary_question :salary_question? do
        next_node do
          question :value_question?
        end
      end

      # todo: string, integer, float
      value_question :value_question? do
        next_node do
          outcome :outcome
        end
      end

      outcome :outcome
    end
  end
end
