require 'string_utils'
require 'pry'

class GroupTransaction
	
	@@OPERATORS = ["CREATE", 
				  "JOIN", #Will have appended number
		          "LEAVE", 
		          "CHECK",
		      	  "SAFE"]

	def self.parseMessage(message) 

	    @containsOperator = false;
	    @operator = nil

	    puts "Attempting to parse #{message}"

	    @@OPERATORS.each do |o|
	    	# puts "Checking for #{o}"
	    	foundOperators = message.scan(/\b#{o}\b/i)
			if !foundOperators.empty?
				# puts "Found instance of #{o}"
				@containsOperator = true
				@operator = foundOperators.first
				break
			else
				puts "Did not find instance of #{o}"
			end
		end

	    if (@containsOperator)
	    	group = GroupTransaction.new
	    	group.setOperator(@operator)

	    	if(@operator == "JOIN") 
				@parsedNumber = message.convert_to_phone

				#need to check if number exists in DB here
	    		if ((@parsedNumber != nil))
	    			group.setGroupId(@parsedNumber)
	    		else
	    			raise "Bad number passed into a JOIN cause."
	    		end
	    	end
	    	return group
		else
			puts "Did not create group!"
    		return nil
		end
	end

	def initialize()
		#TODO pull these in dynamically from database
	end

	def isValidOperator(operator)
		# puts "is valid operator : #{operator}"
		# puts "VALS #{@@OPERATORS}"
		return (@@OPERATORS || '').include? operator.upcase
	end

	def setOperator(operator)
		if isValidOperator(operator)
			@localOperator = operator
		else
			raise "Cannot set #{operator} as AlertTransaction operator."
		end
	end

	def getCurrentOperator
		return @localOperator
	end

	def setGroupId(id)
		@localGroupId = id
	end

	def getGroupId
		return @localGroupId
	end

	def setNumber(number)
		@phoneNumber = number.to_s
	end

    def outString
    	puts "Group Transaction
    		  operator    :: #{@localOperator}
    		  groupNumber :: #{@localGroupId}
    		  phoneNumber :: #{@phoneNumber}"
    end

    def execute
    	#either add of remove user from corresponding list
    end
end
