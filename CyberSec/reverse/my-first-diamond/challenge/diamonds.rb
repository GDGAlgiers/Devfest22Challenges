def check_format(input)
    if input.start_with?("DevFest22{") and input.end_with?("}")
        return true
    else
        return false
    end
end

def strip(input)
    new_input = input.dup
    new_input["DevFest22{"] = ""
    new_input["}"] = ""
    return new_input
end

def check_result(input)
    return (input[0].ord == 97 and input[1].ord == 82 and input[2].ord == 51 and input[3].ord == 110 and input[4].ord == 116 and input[5].ord == 95 and input[6].ord == 100 and input[7].ord == 49 and input[8].ord == 65 and input[9].ord == 109 and input[10].ord == 48 and input[11].ord == 110 and input[12].ord == 68 and input[13].ord == 53 and input[14].ord == 95 and input[15].ord == 99 and input[16].ord == 48 and input[17].ord == 48 and input[18].ord == 76 and input[19].ord == 63)
end

begin
    puts "You have my diamond? :"
    input = gets.chomp
    if check_format(input)
        result = strip(input)
        if result.length == 20
            if check_result(result)
                puts "Correct!"
            else
                puts "I think you will get it next time :("
            end
        else
            puts "Wrong length!"
        end
    else
        puts "Incorrect format!"
    end
rescue
    puts "There was an error."
end