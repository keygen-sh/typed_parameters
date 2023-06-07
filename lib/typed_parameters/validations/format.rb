# frozen_string_literal: true

require 'typed_parameters/validations/validation'

module TypedParameters
  module Validations
    class Format < Validation
      def call(value)
        raise ValidationError, 'format is invalid' unless
          case options
          in without: Regexp => rx
            !rx.match?(value)
          in with: Regexp => rx
            rx.match?(value)
          end
      end
    end
  end
end
