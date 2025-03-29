with AWS.Server;
with AWS.Response;
with AWS.Status;
with AWS.Messages;
with AWS.Environment;
with Chat_Responses;
with Ada.Text_IO;

procedure Chat_Server is
   use AWS;
   use AWS.Server;
   use AWS.Response;
   use AWS.Status;
   use AWS.Messages;
   use AWS.Environment;
   use Ada.Text_IO;
 
   function Process_Request (Request : AWS.Status.Data) return Response.Data is
      User_Message : String := AWS.Messages.Parameter (Request, "message");
      AI_Response  : String := Chat_Responses.Get_Response (User_Message);
      Response_Headers : AWS.Response.Headers := AWS.Response.Headers;
   begin
     
      AWS.Response.Set_Header (Response_Headers, "Access-Control-Allow-Origin", "*");
      return AWS.Response.Text (AI_Response, Headers => Response_Headers);
   end Process_Request;

   
   Server : AWS.Server.HTTP;
begin
   Put_Line ("Starting Ada Chatbot Server on port 8080...");
   Server.Set_URL_Handler ("/chat", Process_Request'Access);
   Server.Start (8080);
end Chat_Server;
