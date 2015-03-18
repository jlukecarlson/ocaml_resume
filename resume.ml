open Format

let name = "Luke Carlson"
let email = "carjack@seas.upenn.edu"	      
	     
type job = {
  title: string;
  company: string;
  about: string list;
  time: string;
}

type school = {
  institution: string;
  major: string;
  grad_year: string;
}
	   
type entity =
  | Job of job * entity
  | School of school * entity
  | End
	     
let penn : school = {
  major="BSE in Computer Science, School of Engineering";
  institution="University of Pennsylvania";
  grad_year="Class of 2017";
}
		      
let ta : job = {
  title="Teaching Assistant";
  company="UPenn Computer Science Department";
  about=["• Direct weekly recitations for second level CIS course CIS 120: Programming Languages and Tech.";
	"• Attend weekly professor meetings; grade assignments and exams; hold regular office hours."];
  time="Fall 2014 - Present";
}

let ruse : job = {
  title="Freelance Developer";
  company="Ruse Laboratories";
  about=["• Designed and executed the restyling of Congressional candidate Roy Cho’s website (roycho.com).";
	"• Collaborated with the campaign manager and head of content to iterate on aspects of site.";
	"• Played a role in the redesign effort for Galore’s magazine site (galoremag.com) and model agency."];
  time="August - December 2014";
}

let appboy_dev : job = {
  title="Software Engineering Intern";
  company="Appboy";
  about=["• Worked directly with customer support to update backend of project documentation and academy sites.";
	"• Enabled the sending of Android image push notifications to millions of consumers via web interface.";
	"• Led the integration of new Kindle Platform into core product."];
  time="Summer 2014";
}		   

let appboy_web : job = {
  title="Web Development Intern";
  company="Appboy";
  about=["• Customized website and built tools to streamline workflow and incorporate marketing team requests.";
	"• Created method to generate client leads using Python and CrunchBase.";
	"• Showcased product development and relevant research in regular presentations to management.";
	"• Edited official company blog; Wrote guest post, “5 Easily Avoidable Design Mistakes in iOS Apps."];
  time="Spring - Summer 2013";
}

let resume = School (penn, Job (ta, Job (ruse, Job (appboy_dev, Job (appboy_web, End))))) 

let rec print_entities (e : entity) =
  begin match e with
   | School (s,n) ->
      printf "\n%s\n%s (%s)\n" s.institution s.major s.grad_year;
      print_entities(n)
   | Job (j,n) ->
      printf "\n%s\n%s (%s)\n%s\n" j.company j.title j.time
      (List.fold_right (fun x y -> x^"\n"^y) j.about "");
      print_entities(n)
   | End -> ()
  end
    
;; printf "\n%s\n%s\n\n" name email
;; print_entities resume			 
