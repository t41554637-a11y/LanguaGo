const languages = {
  de: {name: "Немецкий", flag: "🇩🇪", voice: "de-DE", lessons: [
    {phrase: "Guten Morgen!", translation: "Доброе утро!"},
    {phrase: "Ich heiße Anna.", translation: "Меня зовут Анна."}
  ]},
  en: {name: "Английский", flag: "🇬🇧", voice: "en-US", lessons: [
    {phrase: "Good morning!", translation: "Доброе утро!"},
    {phrase: "My name is Anna.", translation: "Меня зовут Анна."}
  ]},
  es: {name: "Испанский", flag: "🇪🇸", voice: "es-ES", lessons: [
    {phrase: "¡Buenos días!", translation: "Доброе утро!"},
    {phrase: "Me llamo Anna.", translation: "Меня зовут Анна."}
  ]},
  zh: {name: "Китайский", flag: "🇨🇳", voice: "zh-CN", lessons: [
    {phrase: "早上好！", translation: "Доброе утро!"},
    {phrase: "我叫安娜。", translation: "Меня зовут Анна."}
  ]}
};

let state = JSON.parse(localStorage.getItem("languago") || '{"streak":0,"xp":0,"words":[],"health":0,"lang":"de"}');
let current = null;

function save() { localStorage.setItem("languago", JSON.stringify(state)); render(); }

function render() {
  document.getElementById("streak").textContent = state.streak + " дней";
  document.getElementById("xp").textContent = "XP: " + state.xp;
  const langs = document.getElementById("languages");
  langs.innerHTML = "";
  for (const [code, lang] of Object.entries(languages)) {
    const button = document.createElement("button");
    button.textContent = lang.flag + " " + lang.name;
    button.onclick = () => { state.lang = code; save(); };
    if (state.lang === code) button.classList.add("active");
    langs.appendChild(button);
  }
  const lesson = languages[state.lang].lessons[0];
  current = lesson;
  document.getElementById("lesson").innerHTML = `<strong>${lesson.phrase}</strong><br>${lesson.translation}`;
  const dict = document.getElementById("dictionary");
  dict.innerHTML = state.words.length ? "" : "<li>Словарь пока пустой.</li>";
  state.words.forEach(word => {
    const item = document.createElement("li");
    item.textContent = `${word.phrase} — ${word.translation}`;
    dict.appendChild(item);
  });
}

document.getElementById("speak").onclick = () => {
  const utterance = new SpeechSynthesisUtterance(current.phrase);
  utterance.lang = languages[state.lang].voice;
  speechSynthesis.speak(utterance);
};

document.getElementById("complete").onclick = () => {
  state.streak += 1;
  state.xp += 20;
  if (!state.words.some(word => word.phrase === current.phrase)) {
    state.words.push(current);
  }
  document.getElementById("dino").textContent = "Супер! Серия сохранена! 🦖";
  save();
};

document.getElementById("health").onclick = () => {
  state.health += 1;
  state.xp += 5;
  document.getElementById("health").textContent = "Готово! Молодец!";
  save();
};

render();
