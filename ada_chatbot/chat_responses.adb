with Ada.Strings.Unbounded; use Ada.Strings.Unbounded;

package body Chat_Responses is

   function Get_Response (Message : String) return String is
      L_Message : String := Lowercase (Message);
   begin
      if L_Message = "hello" then
         return "Hello! How can I help you?";
      elsif L_Message = "how are you" then
         return "I'm an Ada program, running perfectly!";
      elsif L_Message = "bye" then
         return "Goodbye! Have a great day!";
      else
         return "I'm not sure I understand. Can you rephrase?";
      end if;
   end Get_Response;

end Chat_Responses;
