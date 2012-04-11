class FluidTime

  def initialize(input = Time.now)
    @build = ""

    @time = nil
    @time = input if input.is_a?(Time)
    @time = input.to_time if input.is_a?(Date)
    @time = Time.parse(input.to_s) if @time.nil?
  end

  def self.demo
    %w{
      to_time
      to_date
      A.tday.weekday
      weekday.up
      b.mmm.mon
      B.month
      c
      full
      d.day.num.dd
      e.mday
      mmm.d.th.year
      year.mmm.d.th
      H.hh24.mhour.hhour24
      I.hh12.hhour.hhour12
      l.h12.hour.hour12
      j.yday.day_of_year
      m.mm.month_of_year
      M.min.minute
      p.xm.am.pm
      time.ns.p.down
      S.sec.second
      U.th.txt('week')
      W.th.cs._('min')
      w
      x.date
      X.time
      y.yy.sy
      Y.year
      Z.zone.timezone
      _('braces').lb.lp.lc.rc.rp.rb
      _('symbols').lb.tp.tc.tn.ts.td.rb
      db
    }.each {|ex| "FluidTime.new.   #{ex}.to_s".tap {|str| p str + (" %#{80 - str.length}s" % eval(str))} }
    nil
  end


  #####


  def to_s
    hold = @build
    @build = ""
    hold.blank? ? @time.to_s : hold.strip
  end

  def to_time
    @time
  end

  def <=>(o)
    self.to_s <=> o.to_s
  end

  def to_date
    @time.to_date
  end

  def cat(str = ',', sep = ' ')
    @build += str.to_s + sep
    self
  end
  alias :txt :cat
  alias :_ :cat


  #####


  def a; cat @time.strftime('%a') end      # %a - The abbreviated weekday name (``Sun'')
  alias :ddd :a
  alias :wday :a


  def A; cat @time.strftime('%A') end      # %A - The  full  weekday  name (``Sunday'')
  alias :weekday :A
  alias :tday :A


  def b; cat @time.strftime('%b') end      # %b - The abbreviated month name (``Jan'')
  alias :mmm :b
  alias :mon :b


  def B; cat @time.strftime('%B') end      # %B - The  full  month  name (``January'')
  alias :month :B


  def c; cat @time.strftime('%c') end      # %c - The preferred local date and time representation
  alias :full :c


  def d; cat @time.strftime('%d') end      # %d - Day of the month (01..31)
  alias :dd :A
  alias :day :A
  alias :num :d


  def e; cat @time.strftime('%e') end      # %e - Day of the month (1..31)
  alias :mday :e


  def H; cat @time.strftime('%H') end      # %H - Hour of the day, 24-hour clock (00..23)
  alias :hh24 :H
  alias :mhour :H
  alias :hhour24 :H


  def I; cat @time.strftime('%I') end      # %I - Hour of the day, 12-hour clock (01..12)
  alias :hh12 :I
  alias :hhour :I
  alias :hhour12 :I


  def l; cat @time.strftime('%l') end      # %l - hour, 12-hour clock, blank-padded ( 0..12)
  alias :h12 :l
  alias :hour :l
  alias :hour12 :l


  def j; cat @time.strftime('%j') end      # %j - Day of the year (001..366)
  alias :yday :j
  alias :day_of_year :j


  def m; cat @time.strftime('%m') end      # %m - Month of the year (01..12)
  alias :mm :m
  alias :month_of_year :m


  def M; cat @time.strftime('%M') end      # %M - Minute of the hour (00..59)
  alias :min :M
  alias :minute :M


  def p; cat @time.strftime('%p') end      # %p - Meridian indicator (``AM''  or  ``PM'')
  alias :xm :p
  alias :am :p
  alias :pm :p


  def S; cat @time.strftime('%S') end      # %S - Second of the minute (00..60)
  alias :sec :S
  alias :second :S


  def U; cat @time.strftime('%U') end      # %U - Week number of the current year,
                                           #      starting with the first Sunday
                                           #                 as the first day
                                           #                 of the first week (00..53)


  def W; cat @time.strftime('%W') end      # %W - Week number of the current year,
                                           #       starting with the first Monday
                                           #                  as the first day
                                           #                  of the first week (00..53)



  def w; cat @time.strftime('%w') end      # %w - Day of the week (Sunday is 0, 0..6)


  def x; cat @time.strftime('%x') end      # %x - Preferred representation for the date alone, no time
  alias :date :x


  def X; cat @time.strftime('%X') end      # %X - Preferred representation for the time alone, no date
  alias :time24 :X


  def y; cat @time.strftime('%y') end      # %y - Year without a century (00..99)
  alias :yy :y
  alias :sy :y


  def Y; cat @time.strftime('%Y') end      # %Y - Year with century
  alias :year :Y


  def Z; cat @time.strftime('%Z') end      # %Z - Time zone name
  alias :zone :Z
  alias :timezone :Z


  ##### Symbols


  def nospace;  @build.strip!; self end; alias :ns :nospace

  def period; ns.txt '.', '' end; alias :tp :period
  def comma;  ns.txt ',', '' end; alias :tc :comma
  def colon;  ns.txt ':', '' end; alias :tn :colon
  def dash;   ns.txt '-', '' end; alias :td :dash
  def slash;  ns.txt '/', '' end; alias :tl :slash
  def space;     txt ' '     end; alias :ts :space

  def lbrace;  ns.txt '[', '' end; alias :lb :lbrace
  def rbrace;  ns.txt ']', '' end; alias :rb :rbrace

  def lcurve;  ns.txt '{', '' end; alias :lc :lcurve
  def rcurve;  ns.txt '}', '' end; alias :rc :rcurve

  def lparen;  ns.txt '(', '' end; alias :lp :lparen
  def rparen;  ns.txt ')', '' end; alias :rp :rparen

  def comma_space; ns.txt ', ' end; alias :cs :comma_space


  #####


  def th
    @build = @build.split.tap do |parts|
      parts << parts.pop.tap { |last| last.replace(numeric?(last) ? last.to_i.ordinalize : last) }
    end.join(' ') + ' '
    self
  end

  def ytt
    @build = @build.gsub('-', '/').split.tap do |parts|
      parts.each_with_index do |part, index|
        date = Date.parse(part) rescue nil
        parts[index] = 'Today' if date.is_a?(Date) && date.to_s == Date.today.to_s
        parts[index] = 'Tomorrow' if date.is_a?(Date) && date.to_s == Date.tomorrow.to_s
        parts[index] = 'Yesterday' if date.is_a?(Date) && date.to_s == Date.yesterday.to_s
      end
    end.join(' ') + ' '
    self
  end


  def down
    @build = @build.split.tap { |parts| parts << parts.pop.downcase }.join(' ') + ' '
    self
  end

  alias :lower :down

  def up
    @build = @build.split.tap { |parts| parts << parts.pop.upcase }.join(' ') + ' '
    self
  end

  alias :upper :up


  #####


  def db
    self.Y.td.m.td.d.H.tn.I.tn.S
  end

  def usdate
    self.mm.tl.d.tl.Y
  end

  def Ymd
    self.Y.ns.mm.ns.d
  end

  def Y_m_d
    self.Y.td.mm.td.d
  end

  def time
    self.hhour.tn.minute.tn.second
  end

  #####


  private

  def numeric?(string)
    true if Float(string) rescue false
  end

end