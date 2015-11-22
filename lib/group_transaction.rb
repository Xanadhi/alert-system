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
	    	output = group.outString
	    	# puts "Created alert from parsed message : #{output}"
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

    def outString
    	puts "Group Transaction
    		  operator :: #{@localOperator}"
    end

    def execute
    	#either add of remove user from corresponding list
    end
end
