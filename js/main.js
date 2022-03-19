

// document.querySelectorAll(td)
const topic = document.getElementsByTagName('title')[0].innerText;
const topicPageHeader = document.getElementById("head");

topicPageHeader.innerHTML = `<div class="back"><a href="../index.html"><img class="back_icon" src="../icons/arrow_left.png"></a></div><div class="topic_header"><h2>${topic}</h2></div>`; 

//content
const cells = document.getElementsByTagName('td');
for (const cell of cells) {
    cell.innerHTML = '<div class="card-wrapper"><img class="table_image"><img class="soundicon" src="../icons/sound.png"></div><button>?</button>'
    
    const img = cell.getElementsByTagName('img')[0]
    const word = cell.getAttribute('word')
    img.setAttribute('src', './' + word + '.jpg')
    cell.innerHTML += `<audio id=${word} src='./${word}.wav'></audio>`
}

function clickHandler(e) {
    el = e.target;
        if (el.classList.contains('table_image')) {
        const word = el.parentElement.parentElement.getAttribute('word');
        const audio = document.getElementById(word);
        audio.play()    
        // console.log({ word });
        // var msg = new SpeechSynthesisUtterance(word);
        // msg.lang = 'en-GB';
        // msg.rate=0.9;
        // window.speechSynthesis.speak(msg);
    }

    if (el.tagName === 'BUTTON') {
        const word = el.parentElement.getAttribute('word')

        if (el.innerHTML === word) {
            el.innerHTML = "?"
        } else {
            el.innerHTML = word
        }
    }


}

document.addEventListener('click', clickHandler)