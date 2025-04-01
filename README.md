# AI Assistant (Conversational AI+TEXT)

### Project Overview

This application has been developed using Flutter Framework and Dart Language and integrates **Speech-to-Text** and **Text-to-Speech** functionalities along with Conversational AI powered by **OpenAI's ChatGPT**. It uses **Riverpod** for state management to manage chat conversations displayed on the screen.

### 🚀 Features

* 🎙 Speech-to-Text (STT): Convert spoken words into text using speech_to_text.
* 🔊 Text-to-Speech (TTS): Convert text responses to speech using flutter_tts.
* 🤖 Conversational AI: Communicate with an AI chatbot using OpenAI's GPT API.
* 🗂 State Management: Uses Riverpod to manage and update the chat state efficiently.
* 📝 Interactive UI: Displays user and AI responses in a chat interface.




## 🎨 App Screens
<table>
  <tr>
     <td>iOS Speech Recongnition Permission</td>
     <td>iOS Microphone Access</td>
     <td>iOS Chat Interface</td>
    
  </tr>
  <tr>
    <td><img src="https://github.com/user-attachments/assets/aef33f23-ad92-4c31-bb17-baf8158b436f" width=250 height=500></td>
    <td><img src="https://github.com/user-attachments/assets/e5de643a-5688-4a61-9fc3-119a6698574f" width=250 height=500></td>
    <td><img src="https://github.com/user-attachments/assets/f3ef52cc-078d-45d6-9bb3-5465da4a2dfa" width=250 height=500></td>
  </tr>
 </table>

 <table>
  <tr>
     <td>Android Microphone Access/td>
     <td>Home Page</td>
     <td>Android Chat Interface</td>
    
  </tr>


  <tr>
    <td><img src="https://github.com/user-attachments/assets/a2d020e2-fac5-48e7-bb13-344ff16ffa84" width=250 height=500></td>
    <td><img src="https://github.com/user-attachments/assets/36aa44e6-dd11-4e52-bbeb-f038a4c6ead8" width=250 height=500></td>
    <td><img src="https://github.com/user-attachments/assets/44714336-5d93-4355-a6dc-ec9af6fde485" width=250 height=500></td>
  </tr>
 </table>


## 🛠️ Tech Stack
**Flutter**: Cross-platform mobile app development framework.
**Riverpod** : Riverpod’s StateNotifierProvider efficiently listen to state changes for conversational chat interface for chat states.
**http package** is used to send network requests to the OpenWeather API and other external services to fetch and display weather and car data.



### Getting Started

## Installation

**1. Clone the Repository:**  

```sh
git clone https://github.com/yourusername/flutter_ai_voice_assistant.git
cd flutter_ai_voice_assistant
```

**2. Install Dependencies:**

```sh
flutter pub get
```


**3. Set up OpenAI API Key**

* Get your API key from OpenAI.
* Create a .env file and store the key:
```sh
OPENAI_API_KEY=your_openai_api_key_here
```

**4. Run the app:**

```sh
flutter run
```



## Folder Structure
```
├── main.dart
├── models
│   └── message_model.dart
├── providers
│   └── chats_provider.dart
├── screens
│   └── chat_screen.dart
├── services
│   ├── openAI_service.dart
│   ├── speech_text_handler.dart
│   └── text_speech_handler.dart
└── widgets
    ├── app_bar.dart
    ├── chat_bubble.dart
    ├── text_and_voice_field.dart
    ├── voice_or_send_button.dart
    └── widgets.dart

```

## 🛠 How It Works
* User speaks, and the **STT** converts speech into text or user can type in the text too.
* The text is sent to **OpenAI ChatGPT API** for a response.
* The AI-generated response is displayed in the chat and converted into speech using **TTS**.
* The chat history is managed by **Riverpod**, ensuring efficient state updates.



## Contributions
Contributions are welcome! Please fork the repository and create a pull request with your enhancements or fixes.

## Contact
For any inquiries or issues, please contact huda.tariq94@gmail.com



