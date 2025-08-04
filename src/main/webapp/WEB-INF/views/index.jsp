<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Word Typing Practice</title>
    <style>
        body {
            font-family: 'Segoe UI', Arial, sans-serif;
            background: linear-gradient(120deg, #f6d365 0%, #fda085 100%);
            min-height: 100vh;
            margin: 0;
            display: flex;
            align-items: center;
            justify-content: center;
        }
        .card {
            background: #fff;
            border-radius: 18px;
            box-shadow: 0 4px 24px rgba(0,0,0,0.13);
            padding: 40px 32px 32px 32px;
            max-width: 400px;
            width: 100%;
            text-align: center;
        }
        h2 {
            color: #ff6f61;
            margin-bottom: 28px;
        }
        .audio-hidden {
            display: none;
        }
        input[type="text"] {
            width: 90%;
            padding: 12px;
            border: 1px solid #ddd;
            border-radius: 7px;
            font-size: 1.1em;
            margin-bottom: 18px;
            outline: none;
            transition: border 0.2s;
        }
        input[type="text"]:focus {
            border: 1.5px solid #ff6f61;
        }
        .submit-btn {
            width: 100%;
            padding: 13px 0;
            background: linear-gradient(90deg, #ff6f61 0%, #fda085 100%);
            color: #fff;
            border: none;
            border-radius: 7px;
            font-size: 1.1em;
            font-weight: 600;
            cursor: pointer;
            transition: background 0.2s, transform 0.2s;
        }
        .submit-btn:hover {
            background: linear-gradient(90deg, #fda085 0%, #ff6f61 100%);
            transform: translateY(-2px) scale(1.03);
        }
        .result {
            font-size: 20px;
            font-weight: bold;
            margin-top: 18px;
            color: #333;
        }
    </style>
</head>
<body>
    <div class="card">
        <h2>Listen to the word and type it below:</h2>
        <!-- Button to play the word -->
        <button type="button" onclick="speakWord()" class="submit-btn" style="margin-bottom: 15px;">🔊 Play Word</button>
        <script>
            function speakWord() {
                var msg = new SpeechSynthesisUtterance("${word}");
                msg.lang = "en-IN"; // Indian English
                var voices = window.speechSynthesis.getVoices();
                for (var i = 0; i < voices.length; i++) {
                    if (voices[i].lang === "en-IN") {
                        msg.voice = voices[i];
                        break;
                    }
                }
                window.speechSynthesis.speak(msg);
            }
        </script>
        <form method="post" action="/practice/check">
            <input type="hidden" name="word" value="${word}" />
            <input type="text" name="typedWord" placeholder="Type the word here..." required autocomplete="off" />
            <br>
            <button type="submit" class="submit-btn">Submit</button>
        </form>
        <form method="get" action="/practice/">
            <button type="submit" class="submit-btn" style="margin-top:10px;">Next Word</button>
        </form>
        <div class="result">
            ${result}
        </div>
    </div>
</body>
</html>
