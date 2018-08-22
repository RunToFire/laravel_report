$(document).ready(function() {
  if (typeof chord_datas !== "undefined") {
    
    function chordMpr (data) {
      var mpr = {}, mmap = {}, n = 0,
          matrix = [], filter, accessor;

      mpr.setFilter = function (fun) {
        filter = fun;
        return this;
      };
      mpr.setAccessor = function (fun) {
        accessor = fun;
        return this;
      };
      mpr.getMatrix = function () {
        matrix = [];
        _.each(mmap, function (a) {
          if (!matrix[a.id]) matrix[a.id] = [];
          _.each(mmap, function (b) {
           var recs = _.filter(data, function (row) {
              return filter(row, a, b);
            });
            matrix[a.id][b.id] = accessor(recs, a, b);
          });
        });
        return matrix;
      };
      mpr.getMap = function () {
        return mmap;
      };
      mpr.printMatrix = function () {
        _.each(matrix, function (elem) {
          console.log(elem);
        });
      };
      mpr.addToMap = function (value, info) {
        if (!mmap[value]) {
          mmap[value] = { name: value, id: n++, data: info };
        }
      };
      mpr.addValuesToMap = function (varName, info) {
        var values = _.uniq(_.pluck(data, varName));
        _.map(values, function (v) {
          if (!mmap[v]) {
            mmap[v] = { name: v, id: n++, data: info };
          }
        });
        return this;
      };
      return mpr;
    }
      //*******************************************************************
      //  CHORD READER
      //*******************************************************************
    function chordRdr (matrix, mmap) {
        return function (d) {
          var i,j,s,t,g,m = {};
          if (d.source) {
            i = d.source.index; j = d.target.index;
            s = _.where(mmap, {id: i });
            t = _.where(mmap, {id: j });
            m.sname = s[0].name;
            m.sdata = d.source.value;
            m.svalue = +d.source.value;
            m.stotal = _.reduce(matrix[i], function (k, n) { return k + n; }, 0);
            m.tname = t[0].name;
            m.tdata = d.target.value;
            m.tvalue = +d.target.value;
            m.ttotal = _.reduce(matrix[j], function (k, n) { return k + n; }, 0);
          } else {
            g = _.where(mmap, {id: d.index });
            m.gname = g[0].name;
            m.gdata = g[0].data;
            m.gvalue = d.value;
          }
          m.mtotal = _.reduce(matrix, function (m1, n1) { 
            return m1 + _.reduce(n1, function (m2, n2) { return m2 + n2; }, 0);
          }, 0);
          return m;
        };
      }
    
      function chord_init(data_in) {
          
        var mpr = chordMpr(data_in.data);
        
        mpr.addValuesToMap('from').setFilter(function (row, a, b) {
          return (row.from === a.name && row.to === b.name);
        }).setAccessor(function (recs, a, b) {
          if (!recs[0]) return 0;
          return +recs[0].value;
        });
        drawChords(data_in, mpr.getMatrix(), mpr.getMap());

        function value() { return +this.amount; }
      }
      
      function drawChords (data_in, matrix, mmap, owes) {
        var zoom = 10;
        if (chord_data.zoom) {
          zoom += chord_data.zoom;
        }

        var w = data_in.size.x, h = data_in.size.y, r1 = h / 2 - zoom, r0 = r1 - 100;
        var fill = d3.scaleOrdinal()
            .domain(d3.range(4))
            .range(data_in.colors);

        var chord = d3.chord()
            .padAngle(0.02)
            .sortSubgroups(d3.descending)
            .sortChords(d3.descending);

        var arc = d3.arc()
            .innerRadius(r0)
            .outerRadius(r0 + 20);

        var svg = d3.select("#"+chord_data.object).append("svg:svg")
            .attr("width", w)
            .attr("height", h)
            .append("svg:g")
            .attr("id", "circle")
            .attr("transform", "translate(" + (w / 2) + "," + (h / 2) + ")")
            .datum(chord(matrix));

        if (chord_data.title) {
          svg.append("text")
            .attr("x", 0)
            .attr("y", -(h / 2)+12)
            .attr("class", "d3_title")
            .attr("text-anchor", "middle")
            .text(chord_data.title);
        }

        svg.append("circle").attr("r", r0 + 20);

        var rdr = chordRdr(matrix, mmap);

        var g = svg.selectAll("g.group")
          .data((function(chords) {
            return chords.groups;
          }))
          .enter().append("svg:g")
            .attr("class", "group")
            .on("mouseover", mouseover)
            .on("mouseout", function (d) { d3.select("#chord_tooltip").style("visibility", "hidden"); });

        g.append("svg:path")
            .style("fill", function(d) { return fill(d.index); })
            .attr("d", arc);

        g.append("svg:text")
            .each(function(d) { d.angle = (d.startAngle + d.endAngle) / 2; })
            .attr("dy", ".35em")
            .style("font-family", "helvetica, arial, sans-serif")
            .style("font-size", "10px")
            .attr("text-anchor", function(d) { return d.angle > Math.PI ? "end" : null; })
            .attr("transform", function(d) {
              return "rotate(" + (d.angle * 180 / Math.PI - 90) + ")"
                  + "translate(" + (r0 + 26) + ")"
                  + (d.angle > Math.PI ? "rotate(180)" : "");
            })
            .text(function(d) { return rdr(d).gname; });

          var ribbon = d3.ribbon().radius(r0);
          var chordPaths = svg.selectAll("path.chord")
                .data(function(chords) {
                    return chords;
                })
              .enter().append("svg:path")
                .attr("class", "chord")
                .style("stroke", function(d) { return d3.rgb(fill(d.target.index)).darker(); })
                .style("fill", function(d) { return fill(d.target.index); })
                .attr("d", ribbon.radius(r0))
                .on("mouseover", function (d) {
                  d3.select("#chord_tooltip")
                    .style("visibility", "visible")
                    .html(chordTip(rdr(d)))
                    .style("top", function () { return (d3.event.pageY - 100)+"px";})
                    .style("left", function () { return (d3.event.pageX - 100)+"px";});
                })
                .on("mouseout", function (d) { d3.select("#chord_tooltip").style("visibility", "hidden"); });

          function chordTip (d) {
            var p = d3.format(".2%"), q = d3.format(",.3r");
            return d.tname  + " &rarr; "+ d.sname + " " + q(d.svalue) + "<br>"
              + p(d.svalue/d.stotal) + "/  &Sigma; " + d.sname + " " + q(d.stotal) + "<br>"
            + p(d.svalue/d.mtotal) + " / &Sigma; " + q(d.mtotal);
          }

          function groupTip (d) {
            var p = d3.format(".1%"), q = d3.format(",.3r");
            return d.gname + ": " + q(d.gvalue) + "<br>" + p(d.gvalue/d.mtotal) + " / &Sigma; " + q(d.mtotal);
          }

          function mouseover(d, i) {
            d3.select("#chord_tooltip")
              .style("visibility", "visible")
              .html(groupTip(rdr(d)))
              .style("top", function () { return (d3.event.pageY - 80)+"px";})
              .style("left", function () { return (d3.event.pageX - 130)+"px";});

            chordPaths.classed("fade", function(p) {
              return p.source.index != i && p.target.index != i;
            });
          }
      }
    
      for (var i_chord_index = 0; i_chord_index < chord_datas.length; i_chord_index++) {
      chord_data = chord_datas[i_chord_index];
      chord_init(chord_data);
    }
  }
});
