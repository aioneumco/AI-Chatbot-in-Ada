async function sendMessage() {
    let userInput = document.getElementById("user-input").value;
    if (userInput.trim() === "") return;

    // Display user message in chat box
    let chatBox = document.getElementById("chat-box");
    chatBox.innerHTML += `<p><strong>You:</strong> ${userInput}</p>`;

    // Send message to Ada backend
    let response = await fetch(`http://localhost:8080/chat?message=${encodeURIComponent(userInput)}`);

    let result = await response.text();

    // Display AI response
    chatBox.innerHTML += `<p><strong>AdaBot:</strong> ${result}</p>`;

    // Clear input field
    document.getElementById("user-input").value = "";

    // Scroll chat box to bottom
    chatBox.scrollTop = chatBox.scrollHeight;
}
