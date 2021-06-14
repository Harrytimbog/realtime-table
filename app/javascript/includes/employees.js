const employeesUpdate = (() => {
  var updateTable;

  updateTable = function(data) {
    $('#employee-table tbody').append("<tr>\n  <td>" + data.name + "</td>\n  <td>" + data.position + "</td>\n  <td>" + data.office + "</td>\n  <td>" + data.extension + "</td>\n  <td>" + data.start_date + "</td>\n  <td><a href=\"/employees/" + data.id + "\">Show</a></td>\n  <td><a href=\"/employees/" + data.id + "/edit\">Edit</a></td>\n  <td><a data-confirm=\"Are you sure?\" rel=\"nofollow\" data-method=\"delete\" href=\"/employees/" + data.id + "\">Delete</a></td>\n</tr>");
  };

  $(function() {
    var channel, pusher;
    $('#add_employee').on('ajax:success', function(data) {
      $('#add_employee')[0].reset();
    });
    pusher = new Pusher('<%= ENV["PUSHER_KEY"] %>', {
      cluster: '<%= ENV["PUSHER_CLUSTER"] %>',
      encrypted: true
    });
    channel = pusher.subscribe('employee');
    channel.bind('new', function(data) {
      updateTable(data);
    });
  });

});


export { employeesUpdate };
