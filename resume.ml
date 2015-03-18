

(* Resume in OCaml by Luke Carlson *)

let name = "Luke Carlson"
let email = "carjack@seas.upenn.edu"	      
	     
type job = {
  title: string;
  company: string;
  about: string;
  time: string;
  mutable next_job : job option;
}

let penn : job = {
  title="BSE in Computer Science, School of Engineering";
  company="University of Pennsylvania";
  about="";
  time="Class of 2017";
  next_job = None
}
		 
let ta : job = {
  title="Teaching Assistant";
  company="UPenn Computer Science Department";
  about="• Direct weekly recitations for second level CIS course CIS 120: Programming Languages and Tech.\n"
	^"• Attend weekly professor meetings; grade assignments and exams; hold regular office hours.";
  time="Fall 2014 - Present";
  next_job = Some penn
}

let ruse : job = {
  title="Freelance Developer";
  company="Ruse Laboratories";
  about="• Designed and executed the restyling of Congressional candidate Roy Cho’s website (roycho.com).\n"
	^"• Collaborated with the campaign manager and head of content to iterate on aspects of site.\n"
	^"• Played a role in the redesign effort for Galore’s magazine site (galoremag.com) and model agency.";
  time="August - December 2014";
  next_job = Some ta
}

let appboy_dev : job = {
  title="Software Engineering Intern";
  company="Appboy";
  about="• Worked directly with customer support to update backend of project documentation and academy sites.\n"
	^"• Enabled the sending of Android image push notifications to millions of consumers via web interface.\n"
	^"• Led the integration of new Kindle Platform into core product.";
  time="Summer 2014";
  next_job = Some ruse
}		   

let appboy_web : job = {
  title="Web Development Intern";
  company="Appboy";
  about="• Customized website and built tools to streamline workflow and incorporate marketing team requests.\n"
	^"• Created method to generate client leads using Python and CrunchBase.\n"
	^"• Showcased product development and relevant research in regular presentations to management.\n"
	^"• Edited official company blog; Wrote guest post, “5 Easily Avoidable Design Mistakes in iOS Apps.";
  time="Spring - Summer 2013";
  next_job = Some appboy_dev
}
		   

let rec print_jobs (j : job) =
  begin match j.next_job with
    | None -> ()
    | Some j2 -> print_jobs j2
  end;      
  print_endline "";
  print_endline j.company;
  print_endline (j.title ^ " (" ^ j.time ^ ")");
  print_endline j.about;

;; print_newline()
;; print_endline name
;; print_endline email
;; print_jobs appboy_web
;; print_newline()
