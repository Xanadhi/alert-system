class BaseTransaction

  MESS = "SYSTEM ERROR: transaction method missing"

  def initialize; raise MESS; end
  def getOperators; raise MESS; end
  def getKeywords; raise MESS; end
  def outString; raise MESS; end

end