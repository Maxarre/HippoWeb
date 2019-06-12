const removeTag = () => {
  let tagList = document.querySelectorAll('.removetagg');
  console.log(tagList);
  tagList.forEach((tag) => {
    console.log(tag);
    tag.addEventListener('click', (event) => {
      const tagValue = event.currentTarget.innerText;
      const consultationId = parseInt(event.currentTarget.dataset.consultation);
      const formData = new FormData();
      formData.append('tag_name', tagValue);
      Rails.ajax({
       type: 'POST',
       url:`/consultations/${consultationId}/remove_tags`,
       data: formData,
       success: () => {
      }
     });
    event.currentTarget.outerHTML = ""
    });
  });
}


export { removeTag };

