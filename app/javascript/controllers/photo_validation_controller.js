import { Controller } from "@hotwired/stimulus";

export default class extends Controller {
  static targets = ["photoInput", "saveButton"];
  static values = { hasPhoto: Boolean };

  connect() {
    this.validatePhoto();
  }

  validatePhoto() {
    const file = this.photoInputTarget.files[0];
    let isDisabled;
    if (file) {
      const validTypes = [
        "image/jpeg",
        "image/png",
        "image/gif",
        "image/heic",
        "image/heif",
      ];
      isDisabled = !validTypes.includes(file.type);
    } else {
      isDisabled = !this.hasPhotoValue;
    }
    this.saveButtonTarget.disabled = isDisabled;
    this.toggleDisabledClass(isDisabled);
  }

  toggleDisabledClass(isDisabled) {
    if (isDisabled) {
      this.saveButtonTarget.classList.add(
        "bg-gray-300",
        "text-gray-400",
        "cursor-not-allowed",
      );
      this.saveButtonTarget.classList.remove(
        "bg-indigo-600",
        "text-white",
        "hover:bg-indigo-700",
      );
    } else {
      this.saveButtonTarget.classList.remove(
        "bg-gray-300",
        "text-gray-400",
        "cursor-not-allowed",
      );
      this.saveButtonTarget.classList.add(
        "bg-indigo-600",
        "text-white",
        "hover:bg-indigo-700",
      );
    }
  }
}
