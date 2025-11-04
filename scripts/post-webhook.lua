local http = require("socket.http")
local ltn12 = require("ltn12")
local json = require("dkjson")

local gui = require("gui") -- Assuming a GUI library named 'gui' is available

local window = gui.createWindow("Webhook Sender", 400, 200)

local webhookLabel = gui.createLabel("Webhook URL:", 10, 10, 380, 20)
local webhookInput = gui.createTextBox(10, 35, 380, 25)

local messageLabel = gui.createLabel("Message:", 10, 70, 380, 20)
local messageInput = gui.createTextBox(10, 95, 380, 25)

local function sendWebhook()
    local url = webhookInput:getText()
    local message = messageInput:getText()
    if url == "" or message == "" then
        gui.showMessage("Error", "Please fill both fields.")
        return
    end

    local payload = json.encode({content = message})
    local response_body = {}

    local res, code, response_headers = http.request{
        url = url,
        method = "POST",
        headers = {
            ["Content-Type"] = "application/json",
            ["Content-Length"] = tostring(#payload)
        },
        source = ltn12.source.string(payload),
        sink = ltn12.sink.table(response_body)
    }

    if code == 204 or code == 200 then
        gui.showMessage("Success", "Message sent successfully.")
    else
        gui.showMessage("Error", "Failed to send message. HTTP code: " .. tostring(code))
    end
end

local sendButton = gui.createButton("Send", 150, 140, 100, 30)
sendButton:onClick(sendWebhook)

window:add(webhookLabel)
window:add(webhookInput)
window:add(messageLabel)
window:add(messageInput)
window:add(sendButton)

window:show()
