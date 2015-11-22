require 'alert_transaction'

class MessageParser

    def self.parse(message, number)
        result = AlertTransaction.parseMessage(message)
        if (result != nil)
            result.setNumber(number)
            puts result.outString
            return result
        else
            puts "Result of Alerts parse nil.."
        end
    end

end