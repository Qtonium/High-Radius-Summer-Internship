const buttons = document.querySelectorAll('.a')
const overlay =  document.getElementById('overlay')


buttons.forEach(button=>{
    button.addEventListener('click',()=>{
        ck = button.className
        console.log(ck[1])
        if(ck[1]=='1')
        {
            const temp = document.querySelectorAll('.plus')
            tt = temp.item(0)
            tt.classList.add('active')
            overlay.classList.add('active')

        }
        else if(ck[1]=='2')
        {
            const temp = document.querySelectorAll('.ed')
            tt = temp.item(0)
            tt.classList.add('active')
            overlay.classList.add('active')
        }
        else
        {
            const temp = document.querySelectorAll('.dell')
            tt = temp.item(0)
            tt.classList.add('active')
            overlay.classList.add('active')
        }
    })
});

window.addEventListener('scroll',()=>{
	console.log('scrolled',window.scrollY)
	console.log(window.innerHeight)
	
})