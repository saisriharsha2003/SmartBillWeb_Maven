var check = function() {
	const pwd = document.getElementById('password');
	const cpwd = document.getElementById('cpassword');
	const msg = document.getElementById('message');
	cpwd.addEventListener('input', function()
	{
	  if(pwd.value == cpwd.value)
	  {
		msg.textContent = "Password matches.";
		msg.classList.add('match');
		msg.classList.remove('nomatch');
	  }else {
		msg.textContent = "Passwords do not match.";
		msg.classList.add('nomatch');
		msg.classList.remove('match');
	  }
	});
}
  
 var edit_check = function(){
	const pwd = document.getElementById('edit-password');
	const cpwd = document.getElementById('edit-cpassword');
	const msg = document.getElementById('edit-message');
	cpwd.addEventListener('input', function()
	{
	  if(pwd.value == cpwd.value)
	  {
		msg.textContent = "Password matches.";
		msg.classList.add('match');
		msg.classList.remove('nomatch');
	  }else {
		msg.textContent = "Passwords do not match.";
		msg.classList.add('nomatch');
		msg.classList.remove('match');
	  }
	});
}
  
if(document.getElementById("subMenu"))
{
	  let subm = document.getElementById("subMenu");
	  function toggleMenu() {
		  subm.classList.toggle("open-menu");
	  }		
}
  
  
var login_check = function() {
	const pwd = document.getElementById('lpwd');
	const cpwd = document.getElementById('lcpwd');
	const msg = document.getElementById('login_message');
	cpwd.addEventListener('input', function()
	{
	  if(pwd.value == cpwd.value)
	  {
		msg.textContent = "Password matches.";
		msg.classList.add('match');
		msg.classList.remove('nomatch');
	  }else {
		msg.textContent = "Passwords do not match.";
		msg.classList.add('nomatch');
		msg.classList.remove('match');
	  }
	});
}
  
if (document.getElementById('download-receipt') && !document.getElementById('download-receipt').hasEventListener) {
    document.getElementById('download-receipt').hasEventListener = true;

    document.getElementById('download-receipt').addEventListener('click', function () {
        window.jsPDF = window.jspdf.jsPDF;

        const element = document.querySelector('#receipt table');

        html2canvas(element, {
            scale: 3,
            logging: true,
            allowTaint: false,
            useCORS: true,
            backgroundColor: null
        }).then(function (canvas) {
            var imgWidth = 170;
            var pageHeight = 295;
            var imgHeight = canvas.height * imgWidth / canvas.width;
            var heightLeft = imgHeight;
            
            var recpno = sessionStorage.getItem("recp_no");
            
            const marginLeft = (210 - imgWidth) / 2;
            const marginTop = 10;

            const pdf = new jsPDF('p', 'mm', 'a4');
            var position = marginTop;

            var base64image = canvas.toDataURL("image/png");

            pdf.addImage(base64image, 'PNG', marginLeft, position, imgWidth, imgHeight);

            heightLeft -= pageHeight - marginTop;

            while (heightLeft > 0) {
                position = heightLeft - imgHeight + marginTop;
                pdf.addPage();
                pdf.addImage(base64image, 'PNG', marginLeft, position, imgWidth, imgHeight);
                heightLeft -= pageHeight;
            }

            pdf.save(recpno + '_Receipt.pdf');
        });
    });
}
