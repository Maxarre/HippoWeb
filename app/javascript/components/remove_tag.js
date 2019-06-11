const removeTag = () => {
  const tagList = document.querySelectorAll('.removetagg');
  tagList.forEach((tag) => {
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
        const patientId = parseInt(document.querySelector('#patient_id').dataset.target);
        const consultationId = parseInt(document.querySelector('#patient_id').dataset.target);
        window.location.replace(`/patients/${patientId}/consultations/${consultationId}/edit`);
        console.log(`tag deleted!`);
      }
     });
    });
  });
}


export { removeTag };

