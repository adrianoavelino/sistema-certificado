require "rails_helper"
require "./app/services/convert_string_to_array_numbers_service"

RSpec.describe ConvertStringToArrayNumbersService, type: :service do
  describe ".perform" do
    it "retorna um array" do
      converted_number = ConvertStringToArrayNumbersService.perform()
      expect(converted_number).to be_an(Array)
    end

    it "retorna um array de string de números somente com um número" do
      converted_number = ConvertStringToArrayNumbersService.perform("1,")
      expect(converted_number).to match_array(["1"])
    end

    it "retorna um array de string de números removendo espaços em branco antes do número" do
      converted_number =  ConvertStringToArrayNumbersService.perform("10, 12")
      expect(converted_number).to match_array(["10","12"])
    end

    it "retorna um array de string de números removendo espaços em branco depois do número" do
      converted_number =  ConvertStringToArrayNumbersService.perform("  10  ,12")
      expect(converted_number).to match_array(["10","12"])
    end

    it "retorna um array de string de números com números intercalados" do
      converted_number = ConvertStringToArrayNumbersService.perform("1,5,12")
      expect(converted_number).to match_array(["1","5","12"])
    end

    it "retorna um array de string de números com um intervalo de números. Ex: 2-7" do
      converted_number = ConvertStringToArrayNumbersService.perform("2-7 ")
      expect(converted_number).to match_array(["2", "3", "4", "5", "6", "7"])
    end

    it "retorna um array de string de números com um intervalo de números com espaços em branco" do
      converted_number = ConvertStringToArrayNumbersService.perform("2-7 ")
      expect(converted_number).to match_array(["2", "3", "4", "5", "6", "7"])
    end

    it "retorna um array de string de números com números intercalados e intervalo de números" do
      converted_number = ConvertStringToArrayNumbersService.perform("1,3,5-9,11")
      expect(converted_number).to match_array(["1","3","5","6","7","8","9","11"])
    end

    it "retorna um array de string de números somente com números" do
      converted_number = ConvertStringToArrayNumbersService.perform("10-12,1,3,5--9,4..7,4,-1,&,*,_,+,!,@,#,},{,},\n")
      expect(converted_number).to match_array(["10","11","12","1","3","4"])
    end
  end
end
