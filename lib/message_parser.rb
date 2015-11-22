require 'alert_transaction'
require 'group_transaction'

class MessageParser

    def self.parse(message, number)
        
        if (AlertTransaction.parseMessage(message) != nil)
            result = AlertTransaction.parseMessage(message)
            result.setNumber(number)
            puts result.outString
        elsif (GroupTransaction.parseMessage(message) != nil)
            result = GroupTransaction.parseMessage(message)
            result.setNumber(number)
            puts result.outString
            return result
        else
            puts "Result of Alerts parse nil.."
        end
    end

end