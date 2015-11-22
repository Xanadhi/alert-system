class AlertTransaction
	
	@@OPERATORS = ["ADD", 
				  "SUBSCRIBE", 
		          "REMOVE", 
		          "UNSUBSCRIBE"]
	@@KEYWORDS = ["WEATHER",
				 "HEALTH",
				 "SAFETY"]

	def self.parseMessage(message) 

	    @containsOperator = false;
	    @containsKeyword = false;
	    @operator = nil
	    @keyword = nil

	    # puts "Attempting to parse #{message}"

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

	    @@KEYWORDS.each do |k|
	    	# puts "Checking for #{k}"
	    	foundKeywords = message.scan(/\b#{k}\b/i)
			if !foundKeywords.empty?
				# puts "Found instance of #{k}"
				@containsKeyword = true
				@keyword = foundKeywords.first
				break
			else
				puts "Did not find instance of #{k}"
			end
		end

	    if (@containsOperator and @containsKeyword)
	    	alert = AlertTransaction.new
	    	alert.setOperator(@operator)
	    	alert.setKeyword(@keyword)
	    	# output = alert.outString
	    	# puts "Created alert from parsed message : #{output}"
	    	return alert
		else
			puts "Did not create alert!"
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

	def isValidKeyword(keyword)
		# puts "is valid keyword : #{keyword}"
		# puts " VALS #{@KEYWORDS}"
		return (@@KEYWORDS || '').include? keyword.upcase
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

	def setKeyword(keyword)
		if isValidKeyword(keyword)
			@localKeyword = keyword
		else
			raise "Cannot set #{keyword} as AlertTransaction keyword."
		end
	end

	def getCurrentKeyword
		return @localKeyword
	end

	def setNumber(number)
		@phoneNumber = number.to_s
	end

	def getNumber
		return @phoneNumber
	end

    def outString
    	puts "Alert Transaction
    		  operator :: #{@localOperator}
    		  keyword  :: #{@localKeyword}
    		  number   :: #{@phoneNumber}"
    end

    def execute
    	#either add of remove user from corresponding list
    end
end
