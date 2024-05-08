using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace SianemaCinemaTicketingSystem
{
	public partial class Homepage : System.Web.UI.Page
	{
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                BindData();
            }
        }

        private void BindData()
        {
            DataView dataView = sdsMovies.Select(DataSourceSelectArguments.Empty) as DataView;

            if (dataView != null)
            {
                var groupedMovies = GroupMovies(dataView, 3);
                rptMovies.DataSource = groupedMovies;
                rptMovies.DataBind();
            }
        }


        private List<List<DataRowView>> GroupMovies(DataView dataView, int groupSize)
        {
            List<List<DataRowView>> groupedData = new List<List<DataRowView>>();
            List<DataRowView> currentGroup = new List<DataRowView>();

            foreach (DataRowView row in dataView)
            {
                currentGroup.Add(row);

                // Add the group to the list when it reaches the specified size
                if (currentGroup.Count == groupSize)
                {
                    groupedData.Add(new List<DataRowView>(currentGroup));
                    currentGroup.Clear();
                }
            }

            // Add any remaining rows as a final group
            if (currentGroup.Count > 0)
            {
                groupedData.Add(new List<DataRowView>(currentGroup));
            }

            return groupedData;
        }
    }
}