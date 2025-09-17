
import java.awt.Container;
import java.awt.event.ActionEvent;
import java.awt.event.ActionListener;
import java.beans.PropertyVetoException;
import java.util.Date;

import javax.swing.JButton;
import javax.swing.JComboBox;
import javax.swing.JFrame;
import javax.swing.JLabel;
import javax.swing.JPanel;
import javax.swing.JPasswordField;
import javax.swing.JScrollPane;
import javax.swing.JSeparator;
import javax.swing.JTextArea;
import javax.swing.JTextField;

import net.miginfocom.swing.MigLayout;

import com.ibm.as400.access.AS400;
import com.ibm.as400.access.AS400Message;
import com.ibm.as400.access.AS400Text;
// import com.ibm.as400.access.EnvironmentVariableList;
import com.ibm.as400.access.ProgramCall;
import com.ibm.as400.access.ProgramParameter;

// --- update 2025.Sep.13
//     Enable TestPJRunBob.properties 
import java.io.FileInputStream; 
import java.io.IOException;
import java.util.Arrays;
import java.util.ArrayList;
import java.util.List;
import java.util.Properties;

public class TestPJRunBob implements ActionListener
{

    JFrame appFrame;
    JPanel jpaControl;
    JTextField  jtfBobUserid, jtfBobMessage,
                jtfBobMessageOut, jtfBobReturnValue, jtfBobReturnErrorText,
                jtfServer, jtfLoginUserId, jtfSystemCCSID,
                jtfProgramLibrary, jtfProxyProgram;
       
    JTextArea   jtaBobMessage, jtaBobMessageOut, jtaBobReturnErrorText, jtaFeedback;
       
    JPasswordField jpwSystemPassword;
    JComboBox   jcbEnvironment, jcbBobSource, jcbBobFormat, jcbBobCommit, jcbBobBranch,
                jcbBobObject, jcbBobMethod;       
    JButton     jbnRun, jbnClear, jbnExit, jbnResize;
    JLabel      jlbServer, jlbProgramLibrary, jlbProxyProgram, jlbSystemCCSID, jlbLoginUserId, jlbEnvironment, 
                jlbBobSource, jlbBobFormat, jlbBobCommit, jlbBobBranch, jlbBobObject, jlbBobMethod,
                jlbBobUserid, jlbBobMessage, jlbBobReturnValue, jlbBobMessageOut, jlbBobReturnErrorText,
                jlbFeedback;
    
    Container   cPane;
       
    // String      EnvironmentListData[] = {"XDEV", "XDV2", "XACT", "XSIT", "ZUR", "TDEV", "TSIT", "TACT", "RDEV", "RSIT", "RACT", "PDEV", "PACT", "VDEV", "VACT"};
    String      BobSourceListData[] = {"*RMT", "*LOC"};
    String      BobFormatListData[] = {"*BO", "*3R", "*BOL", "*XML"};
    String      BobCommitListData[] = {"*YES", "*NO"};
    // String      BobBranchListData[] = {"*ZD-CCC", "*ZD-SIB", "95"};
    // String      BobObjectListData[] = {"CLT", "POL", "BNK", "CAL", "CBA", "CCA", "CCC", "CLM", "QOT", "RCT", "REQ", "RFD"};
    // String      BobMethodListData[] = {"INQ", "NEW", "ADD", "AUT", "CAN", "CRT", "END", "EXP", "GET", "LPS", "MOD",  "NSD", "NSI", "NSO", "PFL","PMO","POL","PRE","PTN","QEN","RCT","RCV","REG","RNW","RPL","RPN","RPR","RVW","TFR","TKU","PEN","PEM","PED", "IEN"};
    List<String> EnvironmentListData = new ArrayList();
    List<String> BobBranchListData = new ArrayList();
    List<String> BobObjectListData = new ArrayList();
    List<String> BobMethodListData = new ArrayList();
    // String      BobBranchListData[] = {};
    // String      BobObjectListData[] = {};
    // String      BobMethodListData[] = {};
    String      LoginUserId = "";
    String      ServerName = "";
    String      ServerCCSID = "";
    String      DftBobUserId = "";
    
    Integer     intSize = 0;           
    Float       fntSize = 12.0f;    
    
   public static void main(String args[]){
      new TestPJRunBob(); 
   }

   public TestPJRunBob()
   {     
    
        createGUI();
    
   }

       public void createGUI(){

           /*Create a frame, get its contentpane and set layout*/
           appFrame = new JFrame("Polisy/J BO Proxy Test Caller (PJRUNBOB)");

           cPane = appFrame.getContentPane();
           cPane.setLayout(new MigLayout());
           
           //Arrange components on contentPane and set Action Listeners to each JButton
           arrangeComponents();

           setComponentsFontSize();

           appFrame.setSize(1200,800);
           appFrame.setResizable(true);
           appFrame.setVisible(true);
           appFrame.setDefaultCloseOperation(JFrame.EXIT_ON_CLOSE);
      
       }
    public void setComponentsFontSize(){
        jtfServer.setFont(jtfServer.getFont().deriveFont(fntSize));
        jtfProgramLibrary.setFont(jtfProgramLibrary.getFont().deriveFont(fntSize));
        jtfProxyProgram.setFont(jtfProxyProgram.getFont().deriveFont(fntSize));
        jtfSystemCCSID.setFont(jtfSystemCCSID.getFont().deriveFont(fntSize));
        jtfLoginUserId.setFont(jtfLoginUserId.getFont().deriveFont(fntSize));
        jtfBobUserid.setFont(jtfBobUserid.getFont().deriveFont(fntSize));
        jtfBobMessage.setFont(jtfBobMessage.getFont().deriveFont(fntSize));
        jtaBobMessage.setFont(jtaBobMessage.getFont().deriveFont(fntSize));
        jtfBobMessageOut.setFont(jtfBobMessageOut.getFont().deriveFont(fntSize));
        jtaBobMessageOut.setFont(jtaBobMessageOut.getFont().deriveFont(fntSize));
        jtfBobReturnValue.setFont(jtfBobReturnValue.getFont().deriveFont(fntSize));
        jtfBobReturnErrorText.setFont(jtfBobReturnErrorText.getFont().deriveFont(fntSize));
        jtaBobReturnErrorText.setFont(jtaBobReturnErrorText.getFont().deriveFont(fntSize));
        jtaFeedback.setFont(jtaFeedback.getFont().deriveFont(fntSize));

        jcbEnvironment.setFont(jcbEnvironment.getFont().deriveFont(fntSize));
        jcbBobSource.setFont(jcbBobSource.getFont().deriveFont(fntSize));
        jcbBobFormat.setFont(jcbBobFormat.getFont().deriveFont(fntSize));
        jcbBobCommit.setFont(jcbBobCommit.getFont().deriveFont(fntSize));
        jcbBobBranch.setFont(jcbBobBranch.getFont().deriveFont(fntSize));
        jcbBobObject.setFont(jcbBobObject.getFont().deriveFont(fntSize));
        jcbBobMethod.setFont(jcbBobMethod.getFont().deriveFont(fntSize));
        jcbBobMethod.setFont(jcbBobMethod.getFont().deriveFont(fntSize));

        jlbServer.setFont(jlbServer.getFont().deriveFont(fntSize));
        jlbProgramLibrary.setFont(jlbProgramLibrary.getFont().deriveFont(fntSize));
        jlbProxyProgram.setFont(jlbProxyProgram.getFont().deriveFont(fntSize));
        jlbSystemCCSID.setFont(jlbSystemCCSID.getFont().deriveFont(fntSize));
        jlbLoginUserId.setFont(jlbLoginUserId.getFont().deriveFont(fntSize));
        jlbEnvironment.setFont(jlbEnvironment.getFont().deriveFont(fntSize));
        jlbBobSource.setFont(jlbBobSource.getFont().deriveFont(fntSize));
        jlbBobFormat.setFont(jlbBobFormat.getFont().deriveFont(fntSize));
        jlbBobCommit.setFont(jlbBobCommit.getFont().deriveFont(fntSize));
        jlbBobObject.setFont(jlbBobObject.getFont().deriveFont(fntSize));
        jlbBobMethod.setFont(jlbBobMethod.getFont().deriveFont(fntSize));
        jlbBobBranch.setFont(jlbBobBranch.getFont().deriveFont(fntSize));
        jlbBobUserid.setFont(jlbBobUserid.getFont().deriveFont(fntSize));
        jlbBobMessage.setFont(jlbBobMessage.getFont().deriveFont(fntSize));
        jlbBobReturnValue.setFont(jlbBobReturnValue.getFont().deriveFont(fntSize));
        jlbBobMessageOut.setFont(jlbBobMessageOut.getFont().deriveFont(fntSize));
        jlbBobReturnErrorText.setFont(jlbBobReturnErrorText.getFont().deriveFont(fntSize));
        jlbFeedback.setFont(jlbFeedback.getFont().deriveFont(fntSize));

        jbnRun.setFont(jbnRun.getFont().deriveFont(fntSize));
        jbnClear.setFont(jbnClear.getFont().deriveFont(fntSize));
        jbnExit.setFont(jbnExit.getFont().deriveFont(fntSize));
        jbnResize.setFont(jbnResize.getFont().deriveFont(fntSize));
    }
       
       @SuppressWarnings("rawtypes")
    public void arrangeComponents(){

        loadProperties();
        
   	//--   Configuration
    	   jtfServer = new JTextField(10);
    	   jtfServer.setText(ServerName);
           jtfServer.setEditable(false);

           jtfProgramLibrary = new JTextField(10);
    	   jtfProgramLibrary.setText("QGPL");
       	   jtfProgramLibrary.setEditable(false);
       	    	   
    	   jtfProxyProgram = new JTextField(10);
    	   jtfProxyProgram.setText("PJRUNBOBCL");
       	   jtfProxyProgram.setEditable(false);

    //---- Server CCSD (ex: 5026, 5035, etc.)
           jtfSystemCCSID = new JTextField(5);
    	   jtfSystemCCSID.setText(ServerCCSID);
           jtfSystemCCSID.setEditable(false);
    	   
    //---- Default Login user (JPTTAQ)
           jtfLoginUserId = new JTextField(10);
           jtfLoginUserId.setEditable(true);
           jtfLoginUserId.setText(LoginUserId);
    	   
    	   jpwSystemPassword = new JPasswordField(10);
    	   
    //---- default BOB User ID (JPTTAQ)
           jtfBobUserid   = new JTextField(8);
           jtfBobUserid.setText(DftBobUserId);
           jtfBobUserid.setEditable(true);
           
  //       "00000001JPTTAQ              CLT       INQ       009291YIRN0                                         CLTZUR    0079900001          99004525                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                             ");
           String dftBOMsg = "00000001" + String.format("%-10s", DftBobUserId) + "          CLT       INQ       009291YIRN0                                         CLTZUR    0079900001          99004525                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                             ";

           jtfBobMessage  = new JTextField(32000);
           jtfBobMessage.setText(dftBOMsg);

           jtaBobMessage  = new JTextArea();
           jtaBobMessage.setLineWrap(true);
           jtaBobMessage.setWrapStyleWord(true);
           jtaBobMessage.setText(dftBOMsg);
           
           jtfBobMessageOut  = new JTextField(32000);
           jtfBobMessageOut.setEditable(false);
           
           jtaBobMessageOut  = new JTextArea();
           jtaBobMessageOut.setLineWrap(true);
           jtaBobMessageOut.setWrapStyleWord(true);
           jtaBobMessageOut.setEditable(false);
           
           jtfBobReturnValue  = new JTextField(100);
           jtfBobReturnValue.setEditable(false);

           jtfBobReturnErrorText = new JTextField(5003);
           jtfBobReturnErrorText.setEditable(false);

           jtaBobReturnErrorText = new JTextArea();
           jtaBobReturnErrorText.setLineWrap(true);
           jtaBobReturnErrorText.setWrapStyleWord(true);
           jtaBobReturnErrorText.setEditable(false);

           jtaFeedback = new JTextArea();
           jtaFeedback.setLineWrap(true);
           jtaFeedback.setWrapStyleWord(true);
           jtaFeedback.setEditable(false);

           String[] lEnv = new String[EnvironmentListData.size()];
           EnvironmentListData.toArray(lEnv);
           jcbEnvironment = new JComboBox(lEnv);
           jcbEnvironment.setEditable(false);
           
           jcbBobSource = new JComboBox(BobSourceListData);
           jcbBobSource.setEditable(false);
           
           jcbBobFormat = new JComboBox(BobFormatListData);
           jcbBobFormat.setEditable(false);
           
           jcbBobCommit = new JComboBox(BobCommitListData);
           jcbBobCommit.setEditable(false);
           
           String[] lBrn = new String[BobBranchListData.size()];
           BobBranchListData.toArray(lBrn);
           jcbBobBranch = new JComboBox(lBrn);
           jcbBobBranch.setEditable(false);

           String[] lBob = new String[BobObjectListData.size()];
           BobObjectListData.toArray(lBob);
           jcbBobObject = new JComboBox(lBob);
           jcbBobObject.setEditable(false);
           
           String[] lMethod = new String[BobMethodListData.size()];
           BobMethodListData.toArray(lMethod);
           jcbBobMethod = new JComboBox(lMethod);
           jcbBobMethod.setEditable(false);
           
           jbnRun   = new JButton("Run");
           jbnClear  = new JButton("Clear");
           jbnExit    = new JButton("Exit");
           jbnResize   = new JButton("Resize");

           cPane.add(new JSeparator(),"gapy 10, growx, span 4, wrap 10");
           jlbServer = new JLabel("IBM-i (AS400/iSeries) Server"); 
           cPane.add(jlbServer);
           cPane.add(jtfServer, "split");
           
           jlbSystemCCSID = new JLabel("Server CCSID"); 
           cPane.add(jlbSystemCCSID, "gap 45");
           cPane.add(jtfSystemCCSID, "gap 15, split");

           jlbProgramLibrary = new JLabel("BO Proxy Library");
           cPane.add(jlbProgramLibrary, "gap 45");
           cPane.add(jtfProgramLibrary,"gap 15, split");

           jlbProxyProgram = new JLabel("Program"); 
           cPane.add(jlbProxyProgram, "gap 20");
           cPane.add(jtfProxyProgram,"gap 15, wrap");

           cPane.add(new JSeparator(),"gapy 10, growx, span 4, wrap 10");
           
           jlbLoginUserId = new JLabel("Application User ID (Login)");  
           cPane.add(jlbLoginUserId);
           cPane.add(jtfLoginUserId,"wrap");
           
           cPane.add(new JSeparator(),"gapy 10, growx, span 4, wrap 10");

           jlbBobSource = new JLabel("Business Object Source"); 
           cPane.add(jlbBobSource);
           cPane.add(jcbBobSource, "split");

           jlbBobFormat = new JLabel("BOB Format"); 
           cPane.add(jlbBobFormat,"gap 45");
           cPane.add(jcbBobFormat,"gap 15, split");

           jlbBobCommit = new JLabel("BOB Commit");  
           cPane.add(jlbBobCommit,"gap 45");
           cPane.add(jcbBobCommit, "gap 15, wrap");

           cPane.add(new JSeparator(),"gapy 10, growx, span 4, wrap 10");

           jlbEnvironment = new JLabel("Polisy/J Environment");
           cPane.add(jlbEnvironment);
           cPane.add(jcbEnvironment,"split");

           jlbBobBranch = new JLabel("Branch"); 
           cPane.add(jlbBobBranch, "gap 45");
           cPane.add(jcbBobBranch, "gap 15, wrap");

           cPane.add(new JSeparator(),"gapy 10, growx, span 4, wrap 10");

           jlbBobObject = new JLabel("Business Object / Method"); 
           cPane.add(jlbBobObject);
           cPane.add(jcbBobObject, "split");

           jlbBobMethod = new JLabel("BO Method"); 
           cPane.add(jcbBobMethod, "gap 15, split");

           jlbBobUserid = new JLabel("BOB User ID"); 
           cPane.add(jlbBobUserid, "gap 170");
           cPane.add(jtfBobUserid, "gap 15, wrap");

           cPane.add(new JSeparator(),"gapy 10, growx, span 4, wrap 10");

           jlbBobMessage = new JLabel("Business Object Input Message"); 
           cPane.add(jlbBobMessage);
           cPane.add(new JScrollPane(jtaBobMessage), "hmin 10%, growx, wrap");
           
           cPane.add(new JSeparator(),"gapy 10, growx, span 4, wrap 10");
           jlbBobReturnValue = new JLabel("Business Object Return Value"); 
           cPane.add(jlbBobReturnValue);
           cPane.add(jtfBobReturnValue, "wrap");

           jlbBobMessageOut = new JLabel("Business Object Return Message"); 
           cPane.add(jlbBobMessageOut);
           cPane.add(new JScrollPane(jtaBobMessageOut), "hmin 10%, growx, wrap");

           jlbBobReturnErrorText = new JLabel("Business Object Error Text");
           cPane.add(jlbBobReturnErrorText);
           cPane.add(new JScrollPane(jtaBobReturnErrorText), "hmin 5%, growx, wrap");

           cPane.add(new JSeparator(),"gapy 10, growx, span 4, wrap 10");
           jpaControl = new JPanel();
           jpaControl.add(jbnRun);
           jpaControl.add(jbnClear);
           jpaControl.add(jbnExit);
           jpaControl.add(jbnResize);
           
           cPane.add(jpaControl, "align left, wrap");
           
           cPane.add(new JSeparator(),"gapy 10, growx, span 4, wrap 10");

           jlbFeedback = new JLabel("Feedback Area");
           cPane.add(jlbFeedback);
           cPane.add(new JScrollPane(jtaFeedback), "hmin 10%, growx, wrap");
           
           jbnRun.addActionListener(this);
           jbnClear.addActionListener(this);
           jbnExit.addActionListener(this);
           jbnResize.addActionListener(this);
       }

       public void actionPerformed (ActionEvent e){
           
           if (e.getSource() == jbnRun){
             runTest();
             
             jtfBobReturnValue.setCaretPosition(0);
             
//             jtfBobMessage.setCaretPosition(0);
//             jtfBobMessageOut.setCaretPosition(0);
//             jtfBobReturnErrorText.setCaretPosition(0);
             jtaBobMessage.setCaretPosition(0);
             jtaBobMessageOut.setCaretPosition(0);
             jtaBobReturnErrorText.setCaretPosition(0);
        }

           else if (e.getSource() == jbnClear){
            clear();
        }

        else if (e.getSource() == jbnResize){
            if (intSize < 3){
                intSize = intSize + 1;
                fntSize = fntSize + (intSize * 2);
                jbnResize.setText("Resize + " + intSize);
                setComponentsFontSize();    
                appFrame.setSize(1200+(intSize*300),800+(intSize*200));
                // appFrame.pack();
                // appFrame.validate();

            }
            else {
                intSize = 0;
                fntSize = 12.f;
                jbnResize.setText("Resize");
                setComponentsFontSize();    
                appFrame.setSize(1200,800);
                // appFrame.pack();

            }
            ;
        }
           else if (e.getSource() == jbnExit){            
               System.exit(0);
           }

       }
    //    public void setFontSize(Object obj){
    //     obj.setFont(obj.getFont().deriveFont(fntSize));
    //     //   JTextComponent jtf = (JTextComponent)o;    
    //     //   jtf.setFont(jtf.getFont().deriveFont(Float.parseFloat(fontSize.toString())));
    //    }

//--- load property data 
    public void loadProperties(){
        Properties properties = new Properties();
        try (FileInputStream fis = new FileInputStream("./resources/TestPJRunBob.properties")) {
            properties.load(fis);
            //-- Login userid  
            LoginUserId = properties.getProperty("LoginUserId", "JPTTAQ");

            //-- Default BOB User ID
            DftBobUserId = properties.getProperty("BobUserId", "JPTTAQ");

            //-- Server
            ServerName = properties.getProperty("ServerName", "JPZURI08");

            //-- CCSID
            ServerCCSID = properties.getProperty("ServerCCSID", "5026");

            //-- Environment List

            // for(int i = 0; i <= locEnvArr.size(); i++){
            //     EnvironmentListData.add(locEnvArr.get(i));    
            // }    
            String locEnv = properties.getProperty("EnvironmentList", "XDEV,XSIT,XACT,ZUR");
            List<String> locEnvArr = Arrays.asList(locEnv.split(","));
            for (String envD : locEnvArr){
                EnvironmentListData.add(envD);
            }

            String locBrn = properties.getProperty("BranchList", "93,95");
            List<String> locBrnArr = Arrays.asList(locBrn.split(","));
            for (String brnD : locBrnArr){
                BobBranchListData.add(brnD);
            }

            String locBObj = properties.getProperty("BobObjectList", "CLT,POL");
            List<String> locBObjArr = Arrays.asList(locBObj.split(","));
            for (String bobjD : locBObjArr){
                BobObjectListData.add(bobjD);
            }

            String locBMeth = properties.getProperty("BobMethodList", "INQ,NEW,END");
            List<String> locBMethArr = Arrays.asList(locBMeth.split(","));
            for (String bMethD : locBMethArr){
                BobMethodListData.add(bMethD);
            }

        } catch (IOException e) {
            System.err.println("Error loading properties file: " + e.getMessage());
        }
    }


//---- Clear BO message       
       public void clear(){
    	    
        //    jtfBobMessage.setText("");
           jtfBobReturnValue.setText("");
           jtfBobMessageOut.setText("");
           jtaBobMessageOut.setText("");
           jtaFeedback.setText("");
           jtfBobReturnErrorText.setText("");
           jtaBobReturnErrorText.setText("");
           
     }

//--- Call PJRUNBOB 
       public void runTest(){  
    	//    Date d = new Date ();
    	   long starTime =System.currentTimeMillis();
    	   long starTime1 =0;
    	//    long starTime2 =0;
    	   System.out.println("starTime "+starTime);
    	   long endTime =0;
    	   long endTime1=0;
    	//    long endTime2 =0;
    	   int systemCCSID = Integer.parseInt(ServerCCSID);
        //    char[] systemPassword;
    	   String strTemp;
    	   
    	   AS400 system = new AS400(jtfServer.getText());
		
//		Trace.setTraceAllOn(true);


		try {
			system.setUserId(jtfLoginUserId.getText());

//			systemPassword = jpwSystemPassword.getPassword();
//			strTemp = systemPassword.toString();
//			system.setPassword(strTemp.trim());

			systemCCSID = Integer.parseInt(jtfSystemCCSID.getText());
			system.setCcsid(systemCCSID);
			
		} catch (PropertyVetoException e1) {
			// TODO Auto-generated catch block
			e1.printStackTrace();
		}
//		try {
//		System.out.println("CCSID: " + system.getCcsid());
//		System.out.println("NLV: " + system.getNLV());
//		System.out.println("UserId: " + system.getUserId());
//		System.out.println("Version: " + system.getVersion());
//		} catch (Exception e) {
//			e.printStackTrace();
//		}
		
		ProgramCall program = new ProgramCall(system);
		try {
			
			String programName = "/QSYS.LIB/" +
			                     jtfProgramLibrary.getText() + ".LIB/" + 
			                     jtfProxyProgram.getText() + ".PGM"; 
			
			ProgramParameter[] parameterList = new ProgramParameter[13];
			
    //----  XDEV
            AS400Text environment = new AS400Text(4);
			parameterList[0] = new ProgramParameter(environment.toBytes(EnvironmentListData.get(jcbEnvironment.getSelectedIndex())));
			
    //----  *RMT
            AS400Text source = new AS400Text(4);
			parameterList[1] = new ProgramParameter(source.toBytes(BobSourceListData[jcbBobSource.getSelectedIndex()]));
			
    //----  *BO
            AS400Text messageFormat = new AS400Text(4);
			parameterList[2] = new ProgramParameter(messageFormat.toBytes(BobFormatListData[jcbBobFormat.getSelectedIndex()]));
			
    //----  *YES
            AS400Text commitOption = new AS400Text(4);
			parameterList[3] = new ProgramParameter(commitOption.toBytes(BobCommitListData[jcbBobCommit.getSelectedIndex()]));
			
    //----  Timeout
            AS400Text timeoutSeconds = new AS400Text(3);
			parameterList[4] = new ProgramParameter(timeoutSeconds.toBytes("030"));
			
    //----  BO User
            AS400Text bobUserId = new AS400Text(8);
			parameterList[5] = new ProgramParameter(bobUserId.toBytes(jtfBobUserid.getText()));
			
    //----  Branch code (93, etc.)
            AS400Text branch = new AS400Text(10);
 			parameterList[6] = new ProgramParameter(branch.toBytes(BobBranchListData.get(jcbBobBranch.getSelectedIndex())));
  			
    //----  BO Object (POL. CLT, etc.)
            AS400Text bobObj = new AS400Text(3);
  			parameterList[7] = new ProgramParameter(bobObj.toBytes(BobObjectListData.get(jcbBobObject.getSelectedIndex())));
			
    //----  BO Method (INQ, NEW, etc.)
            AS400Text bobMethod = new AS400Text(3);
  			parameterList[8] = new ProgramParameter(bobMethod.toBytes(BobMethodListData.get(jcbBobMethod.getSelectedIndex())));
			
    //----  BO Message (Input)
            AS400Text boInputMsg = new AS400Text(32000, systemCCSID);
     		parameterList[9] = new ProgramParameter(boInputMsg.toBytes(jtaBobMessage.getText().substring(100)));
			
    //----  BO Message (Output)
            parameterList[10] = new ProgramParameter(100);
			parameterList[11] = new ProgramParameter(5003);
			parameterList[12] = new ProgramParameter(32000);
			
			program.setProgram(programName, parameterList);
			System.out.println("before run");
			System.out.println("parameter[0]=" + EnvironmentListData.get(jcbEnvironment.getSelectedIndex()));
			System.out.println("parameter[1]=" + BobSourceListData[jcbBobSource.getSelectedIndex()]);
			System.out.println("parameter[2]=" + BobFormatListData[jcbBobFormat.getSelectedIndex()]);
			System.out.println("parameter[3]=" + BobCommitListData[jcbBobCommit.getSelectedIndex()]);
			System.out.println("parameter[4]=" + "030");
			System.out.println("parameter[5]=" + jtfBobUserid.getText());
			System.out.println("parameter[6]=" + BobBranchListData.get(jcbBobBranch.getSelectedIndex()));
			System.out.println("parameter[7]=" + BobObjectListData.get(jcbBobObject.getSelectedIndex()));
			System.out.println("parameter[8]=" + BobMethodListData.get(jcbBobMethod.getSelectedIndex()));
			System.out.println("parameter[9]=" + jtaBobMessage.getText());
			
	        
        	starTime1 =System.currentTimeMillis();
        	
			if (program.run() != true)
	        {
	            // Report failure.
                StringBuilder msgBdr = new StringBuilder();
                msgBdr.append("BO Proxy Run Abort Error!!").append("\n");
	            System.out.println("BO Proxy Run Abort Error!!!");
	            // Show the messages.
	            AS400Message[] messagelist = program.getMessageList();
	            for (int i = 0; i < messagelist.length; ++i)
	            {
	                // Show each message.0
                    // TBD - assign to feedback area
	                System.out.println(messagelist[i]);
                    msgBdr.append(messagelist[i]).append("\n");
	            }
                jtaFeedback.setText(msgBdr.toString());
	        }
	        // Else no error, get output data.
	        else
	        {
	            endTime1 =System.currentTimeMillis();
	        	System.out.println("Run = true");
	        	AS400Text retval = new AS400Text(100);
	        	AS400Text retvalError = new AS400Text(5003);
	        	AS400Text boOutputMsg = new AS400Text(32000, systemCCSID);
	        	
	            jtfBobReturnValue.setText((String) retval.toObject(parameterList[10].getOutputData()));
	        	
	            strTemp = (String) retvalError.toObject(parameterList[11].getOutputData());
	            jtaBobReturnErrorText.setText(strTemp.trim());
	            
	            System.out.println(jtaBobReturnErrorText.getText());
	            
	            strTemp = (String) boOutputMsg.toObject(parameterList[12].getOutputData());
	            jtaBobMessageOut.setText(strTemp.trim());
	            System.out.println(jtaBobMessageOut.getText());
	            
			//  assign to feedback area 
                System.out.println("starTime1 "+starTime1);
	            System.out.println("endTime1 "+endTime1);
	            System.out.println("Time taken 1: "+(endTime1-starTime1));
	            System.out.println("Runtime Classpath=" + System.getProperty("java.classpath"));

                StringBuilder strBdr = new StringBuilder();
                strBdr.append("Start Time: "+starTime1).append("\n");
                strBdr.append("End Time  : "+endTime1).append("\n");
                strBdr.append("Elapsed     : "+ String.format("%,.4f", (double) (endTime1-starTime1)/1000)).append(" ms\n");
             // strBdr.append("Runtime Classpath=" + System.getProperty("java.classpath")).append("\n");

                jtaFeedback.setText(strBdr.toString());
	        }
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		endTime =System.currentTimeMillis();
		system.disconnectAllServices();
		System.out.println("endTime "+endTime);
		System.out.println("Time taken: " +(endTime-starTime));
     }

}

