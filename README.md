# FluidTime

Stop formatting time like a C-anderthal.  Craft human readable time formats like building a sentence.

    FluidTime.new('2012/04/10 21:22').month.day.th.comma.space.xs.year.txt('@').time.xz.xs.pm.lower.zone.to_s
    # "April 10th, 2012 @ 9:22pm PDT"
    
    FluidTime.new(Time.now).to_s
    FluidTime.new(Date.today).to_s
    FluidTime.new("21:22:00").to_s

Strip zeros, ordinalize, and change case with ease:

    FluidTime.new.time.pm.zone.to_s
    # 09:51:29 PM PDT

    FluidTime.new.time.xz.xs.pm.down.zone.to_s
    # 9:51:51pm PDT

    FluidTime.new.date.hour.colon.min.ytt.xs.pm.down.to_s
    # 04/11/2012 01:46pm

    FluidTime.new.date.hour.colon.min.ytt.xs.pm.down.to_s   # ytt - replaces date with yesterday, today, tomorrow
    # Today 01:45pm

Remember to end your chains with .to_s or use interpolation "Today is #{FluidTime.new.weekday.upper}"

    FluidTime.demo

	# FluidTime.new.   to_time.to_s                      Wed Apr 11 13:47:35 -0700 2012
	# FluidTime.new.   to_date.to_s                                          2012-04-11
	# FluidTime.new.   a.ddd.wday.to_s                                      Wed Wed Wed
	# FluidTime.new.   A.tday.weekday.to_s                Wednesday Wednesday Wednesday
	# FluidTime.new.   b.mmm.smonth.to_s                                    Apr Apr Apr
	# FluidTime.new.   B.month.to_s                                         April April
	# FluidTime.new.   c.to_s                                  Wed Apr 11 13:47:35 2012
	# FluidTime.new.   full.to_s                               Wed Apr 11 13:47:35 2012
	# FluidTime.new.   d.dd.day.num.to_s                                    11 11 11 11
	# FluidTime.new.   e.mday.to_s                                                11 11
	# FluidTime.new.   H.h24.mhour.hour24.to_s                              13 13 13 13
	# FluidTime.new.   I.h12.hour.hour12.to_s                               01 01 01 01
	# FluidTime.new.   l.to_s                                                         1
	# FluidTime.new.   j.yday.day_of_year.to_s                              102 102 102
	# FluidTime.new.   m.mm.mon.month_of_year.to_s                          04 04 04 04
	# FluidTime.new.   M.min.minute.to_s                                       47 47 47
	# FluidTime.new.   p.am.pm.to_s                                            PM PM PM
	# FluidTime.new.   S.sec.second.to_s                                       35 35 35
	# FluidTime.new.   U.to_s                                                        15
	# FluidTime.new.   W.to_s                                                        15
	# FluidTime.new.   w.to_s                                                         3
	# FluidTime.new.   x.autodate.to_s                                04/11/12 04/11/12
	# FluidTime.new.   X.autotime.to_s                                13:47:35 13:47:35
	# FluidTime.new.   y.yy.sy.to_s                                            12 12 12
	# FluidTime.new.   Y.year.to_s                                            2012 2012
	# FluidTime.new.   Z.zone.timezone.to_s                                 PDT PDT PDT
	# FluidTime.new.   date.to_s                                             04/11/2012
	# FluidTime.new.   time.to_s                                               01:47:35
	# FluidTime.new.   db.to_s                                      2012-04-11 13:01:35
	# FluidTime.new.   usdate.to_s                                           04/11/2012
	# FluidTime.new.   W.th.comma.space._('min').to_s                         15th, min
	# FluidTime.new.   date.hour.colon.min.ytt.pm.to_s                   Today 01:47 PM
	# FluidTime.new.   year.mmm.d.th.to_s                                 2012 Apr 11th
	# FluidTime.new.   time.xs.p.down.to_s                                   01:47:35pm
	# FluidTime.new.   txt('01').xz.to_s                                              1
	# FluidTime.new.   txt('1:00').xz.xs.pm.lower.zone.to_s                     1pm PDT
	# FluidTime.new.   _('braces').lb.lp.lc.rc.rp.rb.to_s                  braces[({})]
	# FluidTime.new.   _('symbols').lb.tp.ts.tc.ts.tn.ts.td.rb.to_s    symbols[. , : -]
	# FluidTime.new.   _('symbols').lb.sp.ss.sc.ss.sn.ss.sd.rb.to_s    symbols[. , : -]
	# FluidTime.new.   period.space.comma.to_s                                      . ,
	# FluidTime.new.   colon.space.dash.space.slash.to_s                          : - /


# Contributing to fluid-time
 
* Check out the latest master to make sure the feature hasn't been implemented or the bug hasn't been fixed yet.
* Check out the issue tracker to make sure someone already hasn't requested it and/or contributed it.
* Fork the project.
* Start a feature/bugfix branch.
* Commit and push until you are happy with your contribution.
* Make sure to add tests for it. This is important so I don't break it in a future version unintentionally.
* Please try not to mess with the Rakefile, version, or history. If you want to have your own version, or is otherwise necessary, that is fine, but please isolate to its own commit so I can cherry-pick around it.

# Copyright

Copyright (c) 2012 Steve Lawson. See LICENSE.txt for further details.

