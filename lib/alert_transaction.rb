class AlertTransaction

	def initialize()
    	@OPERATORS = ["ADD", 
    				  "SUBSCRIBE", 
    		          "REMOVE", 
    		          "UNSUSCRIBE"]
    	@KEYWORDS = ["WEATHER",
    				 "HEALTH",
    				 "SAFETY"]
	end

	def setOperator(operator)
		if (@OPERATORS || '').include?('#{operator}')
			@localOperator = operator
		else
			raise "Cannot set #{operator} as AlertTransaction operator."
		end
	end

	def getCurrentOperator
		return @localOperator
	end

	def setKeyword(keyword)
		if (@KEYWORDS || '').include?('#{keyword}')
			@localKeyword = keyword
		else
			raise "Cannot set #{keyword} as AlertTransaction keyword."
		end
	end

	def getCurrentKeyword
		return @localKeyword
	end

	def getOperators
		return @OPERATORS
	end
    
    def getKeywords
    	return @KEYWORDS
    end
    
    def outString
    	puts "Alert Transaction
    		  operator :: #{@localOperator}
    		  keyword  :: #{@localKeyword}"
    end

    def execute

    end
end