// Configure your import map in config/import.rb. Read more: https://github.com/rails/importmap-rails
import "@hotwired/turbo-rails";
import "controllers";

import "trix";
import "@rails/actiontext";

import "popper";
import "bootstrap";

let add_btn = document.querySelector(".add_question_btn");
if (add_btn) {
  let div = add_btn.closest(".question");
  if (div) {
    let all_fs = div.querySelectorAll("fieldset");
    let n = all_fs.length - 1;
    let next_n = n + 1;
    let fs = all_fs[n];
    fs.remove;
    if (fs) {
      add_btn.onclick = (e) => {
        let new_fs = document.createElement("fieldset");
        new_fs.classList.add("border", "m-3", "p-3");
        new_fs.innerHTML = fs.innerHTML
          .replaceAll(
            "_attributes][" + n + "][",
            "_attributes][" + next_n + "]["
          )
          .replaceAll("_attributes_" + n + "_", "_attributes_" + next_n + "_");
        div.appendChild(new_fs);
      };
    }
  }
}
