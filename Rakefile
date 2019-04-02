# Copyright (c) 2018-2019 Yegor Bugayenko
#
# Permission is hereby granted, free of charge, to any person obtaining a copy
# of this software and associated documentation files (the 'Software'), to deal
# in the Software without restriction, including without limitation the rights
# to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
# copies of the Software, and to permit persons to whom the Software is
# furnished to do so, subject to the following conditions:
# The above copyright notice and this permission notice shall be included in all
# copies or substantial portions of the Software.
#
# THE SOFTWARE IS PROVIDED 'AS IS', WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
# IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
# FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
# AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
# LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
# OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
# SOFTWARE.

require 'redcarpet'
require 'rainbow'

def run(cmd)
  print "#{cmd} "
  stdout = `#{cmd} 2>&1`
  if $?.exitstatus.zero?
    print "#{Rainbow('OK').green}\n"
  else
    print "#{Rainbow('ERROR').red} ##{$?.exitstatus}\n"
    puts stdout
    raise "Failed to run #{cmd}"
  end
end

task default: %i[pdf]

task :clean do
  FileUtils.rm_rf('pdf')
  FileUtils.rm_rf('temp')
end

task :pdf do
  opts = '-shell-escape -halt-on-error -interaction=errorstopmode -output-directory=temp'
  FileUtils.mkdir_p('pdf')
  FileUtils.mkdir_p('temp')
  Dir['**/*.tex'].each do |f|
    name = File.basename(f, '.tex')
    next if name.start_with?('_')
    pdf = File.join('pdf', "#{name}.pdf")
    if File.exist?(pdf) && File.mtime(pdf) > File.mtime(f)
      puts "PDF is #{Rainbow('up to date').green}: #{pdf}"
      next
    end
    run("pdflatex #{opts} #{f}")
    run("cd temp; biber #{name}")
    run("pdflatex #{opts} #{f}")
    FileUtils.copy(File.join('temp', "#{name}.pdf"), pdf)
  end
end
